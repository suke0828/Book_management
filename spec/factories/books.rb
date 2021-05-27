FactoryBot.define do
  factory :book do
    isbn { 9_784_797_395_235 }
    title { '１分で話せ' }
    publisher { 'SBクリエイティブ' }
    pubdate { 20_180_315 }
    cover { 'https://cover.openbd.jp/9784797395235.jpg' }
    author { '伊藤羊一／著' }
  end
end
