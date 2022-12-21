<!-- バッジ -->
[![GitHub issues](https://img.shields.io/github/issues/suke0828/Book_management)](https://github.com/suke0828/Book_management/issues)

-目次
-----------------
* [使い方](#使い方)
* [使用技術](#使用技術)
* [アプリの機能の説明](#アプリの機能の説明)
* [アプリの仕組み](#アプリの仕組み)
* [注意事項](#注意事項)
* [Authors](#authors)
* [使用API](#使用api)
</br></br>

# Book_Management
<!-- index page -->
ISBNコードを入力して書籍を登録できます  
<img width="100%" alt="index_page" src="https://user-images.githubusercontent.com/70358393/124338563-98a5e480-dbe3-11eb-8a07-f89ee1283fa0.png"></br>
</br>

## 使い方
このアプリケーションを使うためには`Webpacker`のインストールが必要になります  
From your command line:  


1. Clone this repository  

```git clone https://github.com/suke0828/Book_management```  

2. Go into the repository  
```cd Book_management```  

3. Install dependencies  
```rails webpacker:install```  
```rails webpacker:compile```  

4. Run the app  
```docker-compose up -d```  
```rails s```  

```
git clone https://github.com/suke0828/Book_management
```  

2. Go into the repository  
```
cd Book_management
```  

3. Install dependencies  
```
rails webpacker:install
```  

```
rails webpacker:compile
```  

4. Run the app  
```
docker-compose up -d
```

```
rails s
```  


5. [http://localhost:3000](http://localhost:3000) にブラウザでアクセス  

Note:`rails webpacker:install`の際に`node`や`yarn`が入っていないとインストールできないことがあります  

## 使用技術
・Ruby 3.0.0</br>
・Rails 6.1.3.2</br>
・PostgreSQL 13.2</br>
・Docker / Docker-compose</br>
・RSpec(テストフレームワーク) </br>
・Bulma(CSSフレームワーク) </br>
・Elasticsearch 7.13.0(オープンソース検索エンジン)</br>
・openBD(書籍情報・書影API)</br>

## アプリの機能の説明
`Rails6` + `Elasticsearch` + `openBD`</br>
</br>

<!-- new page -->
・ISBNコードを入力して書籍登録するとElasticsearchとDBに、openBD APIから取得したデータを保存します  
<img width="100%" alt="new_page" src="https://user-images.githubusercontent.com/70358393/124338659-25e93900-dbe4-11eb-994f-9ad4d7d67f47.png"></br>
</br>

<!-- search page -->
・検索窓で登録した書籍を検索できます</br>
<img width="100%" alt="search_screen" src="https://user-images.githubusercontent.com/70358393/124338700-5fba3f80-dbe4-11eb-91d9-274fb3ea84d9.png"></br>
</br>

<!-- show page -->
・詳細画面から登録した書籍のデータを見ることができます  
<img width="100%" alt="show_page" src="https://user-images.githubusercontent.com/70358393/124338807-d2c3b600-dbe4-11eb-8394-faad4729d34a.png"></br>
</br>

## アプリの仕組み
<!-- Architecture diagram -->
<img width="100%" alt="Architecture_diagram" src="https://user-images.githubusercontent.com/70358393/124341226-f0e5e200-dbf5-11eb-8d5a-7ecc5830fe6b.png"></br>
</br>

## 注意事項
・書籍のデータがopenBDにないとDBに保存されません  

## Authors
suke0828

## 使用API
[・OpenBD](https://openbd.jp)
