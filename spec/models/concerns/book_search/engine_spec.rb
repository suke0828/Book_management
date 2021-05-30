require 'rails_helper'

RSpec.describe BookSearch::Engine, elasticsearch: true, model_name: 'book' do
  describe 'Book.search' do
    describe '検索ワードにマッチする本の検索' do
      subject(:search_result) { Book.search(query).records.pluck(:id) }

      let!(:book1) do
        FactoryBot.create(:book, title: '1分で話せ', author: '伊藤洋一', isbn: 9_784_797_395_235, publisher: 'SBクリエイティブ')
      end
      let!(:book2) do
        FactoryBot.create(:book, title: '夜間飛行', author: 'サン・テグジュペリ', isbn: 9_784_102_122_013, publisher: '新潮文庫')
      end
      let!(:book3) do
        FactoryBot.create(:book, title: '学問のすすめ', author: '福澤諭吉', isbn: 9_784_480_064_707, publisher: 'ちくま新書')
      end

      # 作成したデータをelasticsearchに登録する
      # refresh: true を追加することで登録したデータをすぐに検索できるようにする
      before { Book.__elasticsearch__.import(refresh: true) }

      context '検索ワードがタイトルにマッチする場合' do
        let(:query) { '1分で話せ' }

        it '検索ワードにマッチする本を取得すること' do
          expect(search_result).to include book1.id
        end

        it '検索ワードにマッチしない本を取得しないこと' do
          expect(search_result).not_to include book2.id, book3.id
        end
      end

      context '検索ワードが複数ある場合' do
        let(:query) { '夜 テグジュペリ' }

        it '両方の検索ワードにマッチする本を取得すること' do
          expect(search_result).to include book2.id
        end

        it '検索ワードにマッチしない本を取得しないこと' do
          expect(search_result).not_to include book1.id, book3.id
        end
      end

      context '検索ワードが著者にマッチする場合' do
        let(:query) { '福澤諭吉' }

        it '検索ワードにマッチする本を取得すること' do
          expect(search_result).to include book3.id
        end

        it '検索ワードにマッチしない本を取得しないこと' do
          expect(search_result).not_to include book1.id, book2.id
        end
      end

      context '検索ワードがisbnにマッチする場合' do
        let(:query) { 9_784_797_395_235 }

        it '検索ワードにマッチする本を取得すること' do
          expect(search_result).to include book1.id
        end

        it '検索ワードにマッチしない本を取得しないこと' do
          expect(search_result).not_to include book2.id, book3.id
        end
      end
    end
  end
end
