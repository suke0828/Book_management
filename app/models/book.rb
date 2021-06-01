class Book < ApplicationRecord
  include BookSearch::Engine
  validates :isbn, presence: true

  def get_json(isbn)
    json_api_data = call_openbd_api(isbn)
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
end
