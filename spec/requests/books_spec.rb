require 'rails_helper'

RSpec.describe 'Books', type: :request do
  describe 'GET /index' do
    it '正常にレスポンスをを返すこと' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /new' do
    it '正常にレスポンスをを返すこと' do
      get new_book_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    it '正常にレスポンスをを返すこと' do
      book = FactoryBot.create(:book)
      get book_path(book.id), xhr: true
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    context 'パラメータが正常な場合' do
      it '正常にレスポンスをを返すこと' do
        post books_path, params: { book: { isbn: 9_784_797_395_235 } }
        expect(response).to have_http_status(:found)
      end

      it '書籍情報が登録されること' do
        expect do
          post books_path, params: { book: { isbn: 9_784_797_395_235 } }
        end.to change(Book, :count).by(1)
      end

      it 'リダイレクトすること' do
        post books_path, params: { book: { isbn: 9_784_797_395_235 } }
        expect(response).to redirect_to root_path
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        post books_path, params: { book: { isbn: 0 } }
        expect(response).to have_http_status(:found)
      end

      it '書籍情報が登録されないこと' do
        expect do
          post books_path, params: { book: { isbn: 0 } }
        end.not_to change(Book, :count)
      end

      it 'エラーが表示されること' do
        post books_path, params: { book: { isbn: 0 } }
        expect(flash[:alert]).to eq('status: 500 Internal Server Error')
      end
    end
  end
end
