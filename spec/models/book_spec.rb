require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'isbnがある場合、有効である' do
    book = FactoryBot.create(:book)
    expect(book).to be_valid
  end

  it 'isbnが無い場合、無効である' do
    book = described_class.new(isbn: nil)
    book.valid?
    expect(book.errors[:isbn]).to include("can't be blank")
  end
end
