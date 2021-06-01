FactoryBot.define do
  factory :book do
    isbn { 9_784_274_226_298 }
    title { '達人プログラマー（第2版)' }
    publisher { 'オーム社' }
    pubdate { 20_201_121 }
    cover { 'https://cover.openbd.jp/9784274226298.jpg' }
    author { 'AndrewHunt／著 DavidThomas／著 村上雅章／翻訳' }
  end
end
