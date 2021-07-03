<!-- バッジ -->
[![GitHub issues](https://img.shields.io/github/issues/suke0828/Book_management)](https://github.com/suke0828/Book_management/issues)

<!-- アイキャッチ画像 -->
[<img width="300px" alt="お天気HISTORY_logo" src="https://user-images.githubusercontent.com/70358393/115185985-dda99700-a11b-11eb-9626-83d0b356fc58.png">](https://otenki-history.herokuapp.com/)</br>

-目次
-----------------
* [概要](#book_management)
* [使い方](#使い方)
* [使用技術](#使用技術)
* [アプリの機能の説明](#アプリの機能の説明)
* [アプリの仕組み](#アプリの仕組み)
* [注意事項](#注意事項)
* [Authors](#authors)
* [使用API](#使用API)
</br></br>

# Book_Management
<!-- index page -->
ISBNコードを入力して書籍を登録できます</br>
<img width="100%" alt="index_page" src="https://user-images.githubusercontent.com/70358393/124338563-98a5e480-dbe3-11eb-8a07-f89ee1283fa0.png"></br>
</br>

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
</br>

<!-- new page -->
・ISBNコードを入力して書籍登録するとElasticsearchとDBに、openBD APIから取得したデータを保存します</br>
<img width="100%" alt="new_page" src="https://user-images.githubusercontent.com/70358393/124338659-25e93900-dbe4-11eb-994f-9ad4d7d67f47.png"></br>
</br>

<!-- search page -->
・検索窓で登録した書籍を検索できます</br>
<img width="100%" alt="search_screen" src="https://user-images.githubusercontent.com/70358393/124338700-5fba3f80-dbe4-11eb-91d9-274fb3ea84d9.png"></br>
</br>

<!-- show page -->
・詳細画面から登録した書籍のデータを見ることができます</br>
<img width="100%" alt="show_page" src="https://user-images.githubusercontent.com/70358393/124338807-d2c3b600-dbe4-11eb-8394-faad4729d34a.png"></br>
</br>

## アプリの仕組み
[lib/tasks/import_csv.rake](lib/tasks/import_csv.rake)</br>

## 注意事項
・書籍のデータがopenBDにないと登録されません</br>

## Authors
suke0828

## 使用API
[・OpenBD](https://openbd.jp)
