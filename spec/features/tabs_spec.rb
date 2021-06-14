require 'rails_helper'

RSpec.describe 'タブのページ遷移', type: :feature do
  before do
    visit root_path
  end

  it '書籍一覧画面に遷移すること' do
    click_link '書籍一覧'
    have_selector('tab_index', class: 'is-active')
    have_no_selector('tab_new', class: 'is-active')
    have_current_path(books_path)
    expect(page).to have_selector('table', class: 'table')
  end

  it '書籍登録画面に遷移すること' do
    have_selector('tab_mew', class: 'is-active')
    have_no_selector('tab_index', class: 'is-active')
    click_link '書籍追加'
    have_current_path(new_book_path)
    expect(page).to have_selector('h1', text: '書籍登録')
  end
end
