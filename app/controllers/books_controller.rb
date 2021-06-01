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

  def create
    book = Book.new(book_params)
    book_info = book.get_json(book.isbn)
    openbd_book = Book.new(book_info)
    redirect_to root_path if openbd_book.save
  end

  private

  def query
    @query ||= params[:query]
  end

  def book_params
    params.require(:book).permit(:isbn)
  end
end
