<!-- バッジ -->
[![GitHub issues](https://img.shields.io/github/issues/suke0828/Book_management)](https://github.com/suke0828/Book_management/issues)

<!-- アイキャッチ画像 -->
[<img width="300px" alt="お天気HISTORY_logo" src="https://user-images.githubusercontent.com/70358393/115185985-dda99700-a11b-11eb-9626-83d0b356fc58.png">](https://otenki-history.herokuapp.com/)</br>

-目次
-----------------
* [概要](#book_management)
* [使い方](#使い方)
* [使用技術](#使用技術)
* [インフラ構成図](#インフラ構成図)
* [天気を取得する仕組み](#天気を取得する仕組み)
* [注意事項](#注意事項)
* [Authors](#authors)
* [使用API](#使用API)
</br></br>

# Book_Management
ISBNコードを入力して書籍を登録できます</br>
<!-- 簡単なデモ（使用例）などスクリーンショットやGIFアニメで表示 -->
<!-- index page -->
<img width="100%" alt="お天気HISTORY indexpage" src="https://user-images.githubusercontent.com/70358393/115184305-80f8ad00-a118-11eb-9cca-592aac0612dd.png"></br>
<!-- show page -->
<img width="100%" alt="神奈川県___お天気HISTORY showpage" src="https://user-images.githubusercontent.com/70358393/115185097-252f2380-a11a-11eb-839a-d8c0d96d2649.png"></br>

### 使い方
このアプリケーションを使うためには`Webpacker`のインストールが必要になります
</br>
From your command line:
</br>

```shell
# Clone this repository
$ git clone https://github.com/suke0828/Book_management

# Go into the repository
$ cd Book_management

# Install dependencies
$ rails webpacker:install
$ rails webpacker:compile

# Run the app
$ docker-compose -d
$ rails s
```
[http://localhost:3000](http://localhost:3000) にブラウザでアクセス

Note:`rails webpacker:install`をした際に`node`や`yarn`が入っていないとインストールできないと怒られることがあります
</br>


## 使用技術
・Ruby 3.0.0</br>
・Rails 6.1.3.2</br>
・PostgreSQL 13.2</br>
・Docker / Docker-compose</br>
・RSpec </br>
・Bulma </br>
・RSpec </br>
・Elasticsearch 7.13.0</br>
・openBD API</br>

## アプリの機能の説明
Rails6 + Elasticsearch + openBD</br>
・ISBNコードを入力して書籍登録するとopenBD APIからデータを取得してElasticsearchとDBに取得したデータを保存します</br>
・検索窓で登録した書籍を検索できます</br>
・詳細画面から登録した書籍のデータと登録日を見ることができます</br>

## アプリの仕組み
[lib/tasks/import_csv.rake](lib/tasks/import_csv.rake)</br>

## 注意事項
・書籍のデータがopenBDにないと登録されません</br>

## Authors
suke0828

## 使用API
[・OpenBD](https://openbd.jp)

