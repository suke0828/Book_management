module BookSearch
  module Engine
    extend ActiveSupport::Concern

    included do
      include Elasticsearch::Model
      # index名
      index_name "es_book_#{Rails.env}"
      # mapping情報
      settings do
        mappings dynamic: 'false' do
          indexes :id,        type: 'integer'
          indexes :isbn,      type: 'text'
          indexes :title,     type: 'text', analyzer: 'kuromoji'
          indexes :publisher, type: 'text', analyzer: 'kuromoji'
          indexes :pubdate,   type: 'text'
          indexes :cover,     type: 'text'
          indexes :author,    type: 'text', analyzer: 'kuromoji'
        end
      end
      # mappingの定義に合わせてindexするドキュメントの情報を生成する
      def as_indexed_json(*)
        attributes
          .symbolize_keys
          .slice(:id, :isbn, :title, :publisher, :pubdate, :cover, :author)
      end
    end

    class_methods do
      # ④indexを作成するメソッド
      def create_index!
        client = __elasticsearch__.client
        # すでにindexを作成済みの場合は削除する
        begin
          client.indices.delete index: index_name
        rescue StandardError
          nil
        end
        # indexを作成する
        client.indices.create(index: index_name,
                              body: {
                                settings: settings.to_hash,
                                mappings: mappings.to_hash
                              })
      end
    end
  end
end
