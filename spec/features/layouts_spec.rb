require 'rails_helper'

RSpec.describe 'アプリレイアウト', type: :feature do
  it 'ナビゲーションバーにタイトルが表示されていること' do
    visit root_path
    have_css('.navbar')
    expect(page).to have_selector('.navbar-brand', text: 'Book Management')
  end
end
