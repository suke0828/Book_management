require 'rails_helper'

RSpec.describe 'モーダルウィンドウ', type: :feature, js: true do
  let!(:book) { FactoryBot.create(:book) }

  it 'タイトルをクリックしたら詳細画面が表示されること' do
    visit root_path
    have_content(book.title.to_s)
    click_link(book.title.to_s)
    have_selector('.modal-card-title', text: '書籍詳細')
    have_css('div.modal')
    expect(page).to have_css('div.is-active')
  end

  it '画面をクリックしたら詳細画面が閉じること' do
    visit root_path
    have_content(book.title.to_s)
    click_link(book.title.to_s)
    have_selector('.modal-card-title', text: '書籍詳細')
    have_css('.modal')
    have_css('div.is-active')
    first('body').click
    expect(page).to have_no_css('div.is-active')
  end
end
