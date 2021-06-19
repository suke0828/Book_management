require 'rails_helper'

RSpec.describe 'フォーム入力', type: :feature, js: true do
  context '入力された値が正常な場合' do
    it '書籍情報が登録されてindexページにリダイレクトされること' do
      visit root_path
      click_link('書籍追加')
      have_current_path(new_book_path)
      have_selector('h1', text: '書籍登録')
      fill_in 'ISBNコード', with: '9784862761545'
      expect { click_on('登録') }.to change(Book, :count).by(1)
      have_current_path(root_path)
    end
  end

  # context '入力された値が不正な場合' do
  #   it '書籍情報が登録されずnewページにリダイレクトされること' do
  #     visit root_path
  #     click_link('書籍追加')
  #     have_current_path(new_book_path)
  #     have_selector('h1', text: '書籍登録')
  #     fill_in 'ISBNコード', with: '0'
  #     expect{ click_on('登録') }.not_to change(Book, :count)
  #     have_current_path(books_path)
  #   end
  # end
end
