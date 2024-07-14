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