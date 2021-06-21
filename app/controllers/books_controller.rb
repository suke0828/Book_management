class BooksController < ApplicationController
  def index
    @books = if query.present?
               Book.search(query).records
             else
               Book.all
             end
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    book = Book.new(book_params)
    json_api_data = call_openbd_api(book.isbn)
    if error_call_api(json_api_data)
      redirect_to book
    else
      Book.create(
        get_json(json_api_data)
      )
      response_success(:book, :create)
      redirect_to root_path
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def query
    @query ||= params[:query]
  end

  def book_params
    params.require(:book).permit(:isbn)
  end

  def get_json(json_api_data)
    # 呼び出しが成功した場合、必要な情報だけを抜き出して新しいJSONを作成する
    {
      isbn: json_api_data[0]['summary']['isbn'],
      title: json_api_data[0]['summary']['title'],
      publisher: json_api_data[0]['summary']['publisher'],
      pubdate: json_api_data[0]['summary']['pubdate'],
      cover: json_api_data[0]['summary']['cover'],
      author: json_api_data[0]['summary']['author']
    }
  end

  def call_openbd_api(isbn)
    url = "https://api.openbd.jp/v1/get?isbn=#{isbn}"
    uri = URI.parse(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def error_call_api(json_api_data)
    # 呼び出しが失敗した場合
    response_internal_server_error if json_api_data.nil?
    # 検索結果が0だった場合
    response_internal_server_error if json_api_data[0].nil?
  end
end
