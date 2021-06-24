require 'rails_helper'

RSpec.describe 'モーダルウィンドウ', type: :feature, js: true do
  let!(:book) { FactoryBot.create(:book) }

  before do
    visit root_path
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
