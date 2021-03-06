require 'rails_helper'

RSpec.describe 'モーダルウィンドウ', type: :feature, js: true do
  let!(:book) { FactoryBot.create(:book) }

  context '詳細画面のモーダルウィンドウの場合' do
    before do
      visit root_path
      click_link '書籍一覧'
      have_content(book.title.to_s)
      click_link(book.title.to_s)
      have_selector('.modal-card-title', text: '書籍詳細')
    end

    it 'タイトルをクリックしたら詳細画面が表示されること' do
      have_css('div.modal')
      expect(page).to have_css('div.is-active')
    end

    it '画面をクリックしたら詳細画面が閉じること' do
      have_css('.modal')
      have_css('div.is-active')
      first('body').click
      expect(page).to have_no_css('div.is-active')
    end

    it '詳細画面にデータが表示されること' do
      aggregate_failures do
        expect(page).to have_selector('td', text: book.title.to_s)
        expect(page).to have_selector("img[src$='#{book.cover}']")
        expect(page).to have_selector('td', text: book.author.to_s)
        expect(page).to have_selector('td', text: book.publisher.to_s)
        expect(page).to have_selector('td', text: book.pubdate.to_s)
        expect(page).to have_selector('td', text: book.isbn.to_s)
        expect(page).to have_selector('td', text: book.created_at.strftime('%Y/%m/%d'))
      end
    end
  end

  context '書籍追加画面のモーダルウィンドウの場合' do
    before do
      visit root_path
      click_link '書籍追加'
    end

    it '書籍追加タブをクリックしたら書籍追加画面が表示されること' do
      have_css('div.modal-new')
      have_css('div.is-active')
      expect(page).to have_css('input')
    end

    it '×ボタンをクリックしたら詳細画面が閉じること' do
      have_css('.modal-new')
      have_css('div.is-active')
      find('.delete').click
      expect(page).to have_no_css('div.is-active')
    end
  end
end
