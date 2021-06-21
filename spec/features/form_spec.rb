require 'rails_helper'

RSpec.describe 'フォーム入力', type: :feature, js: true do
  context '入力された値が正常な場合' do
    it '書籍情報が登録されること' do
      visit root_path
      click_link('書籍追加')
      have_current_path(new_book_path)
      have_selector('h1', text: '書籍登録')
      fill_in 'ISBNコード', with: '9784862761545'
      expect { click_on('登録') }.to change(Book, :count).by(1)
    end

    it 'flashメッセージ[:success]が表示されること' do
      visit root_path
      click_link('書籍追加')
      have_current_path(new_book_path)
      have_selector('h1', text: '書籍登録')
      fill_in 'ISBNコード', with: '9784862761545'
      click_on('登録')
      have_current_path(root_path)
      expect(page).to have_selector('.notification', text: 'Success Book Create')
    end
  end

  context '入力された値が不正な場合' do
    it '書籍情報が登録されないこと' do
      visit root_path
      click_link('書籍追加')
      have_current_path(new_book_path)
      have_selector('h1', text: '書籍登録')
      fill_in 'ISBNコード', with: '0'
      expect { click_on('登録') }.not_to change(Book, :count)
    end

    it 'flashメッセージ[:warning]が表示されること' do
      visit root_path
      click_link('書籍追加')
      have_current_path(new_book_path)
      have_selector('h1', text: '書籍登録')
      fill_in 'ISBNコード', with: '0'
      click_on('登録')
      have_current_path(root_path)
      expect(page).to have_selector('.notification', text: '書籍が見つからないため登録できませんでした')
    end
  end
end
