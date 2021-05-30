FactoryBot.define do
  factory :book do
    isbn { 0o000000000000 }
    title { 'Sample' }
    publisher { 'Sample出版' }
    pubdate { 20_210_530 }
    cover { 'https://cover.openbd.jp/0000000000000.jpg' }
    author { 'Sample太郎' }
  end
end
