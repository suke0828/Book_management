require 'rails_helper'

RSpec.describe 'タブのページ遷移', type: :feature do
  before do
    visit root_path
  end

  it '書籍一覧画面に遷移すること' do
    click_link '書籍一覧'
    expect(page).to have_current_path books_path
  end

  it '書籍登録画面に遷移すること' do
    click_link '書籍追加'
    expect(page).to have_current_path new_book_path
  end
end
