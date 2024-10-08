# 画像投稿時に画像を分析し自動的にタグを付与するアプリケーション

## 概要

画像を投稿する際に、GoogleのCloud Vision APIを用いて画像の分析を行い、特徴をラベルとして5個抽出し、
それを投稿のタグとして付与するアプリケーションを制作しました。

### 開発環境

Amazon Web Service Cloud9 (AWS Cloud9)

### プログラミング言語・フレームワーク

* Ruby (version 3.1.2)
* Ruby on Rails (version 6.1.7.8)

### Web API

Google Cloud Vision API   
公式URL：https://cloud.google.com/vision?hl=ja

### 利用方法

まずは、ユーザの登録を行ってください。   
※ログインしている状態でなければ投稿することや他の人の投稿を見ることが出来ません。

画面上部のナビゲーションバーにある新規投稿から投稿をすることが出来ます。   
タイトルは25文字以内にしてください。   
※投稿時にタイトルと画像は必須です。

画面上部の検索フォームからタグ名で投稿を検索することが出来ます。   
例）検索フォームで「Food」と検索するとFoodというタグが付与されている投稿を表示