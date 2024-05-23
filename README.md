
# README
[![Image from Gyazo](https://i.gyazo.com/71d9e5a7ded2d82cfdb6df93c2a7cec4.jpg)](https://gyazo.com/71d9e5a7ded2d82cfdb6df93c2a7cec4)

## サービスの概要・背景
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。
元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。

## 外部ドキュメント
- 設計書
[![Image from Gyazo](https://i.gyazo.com/bfd5292ff0caf890d0b0ab6d3e6799b5.png)](https://gyazo.com/bfd5292ff0caf890d0b0ab6d3e6799b5)

- スケジュール管理表

- ER図
[![Image from Gyazo](https://i.gyazo.com/354b288c70042159db4c54f3d7696fb8.png)](https://gyazo.com/354b288c70042159db4c54f3d7696fb8)

 ## 使用技術について

__nodeバージョン__
 - node v20.11.1
 - npm v10.4.0

__バック__
 - ruby
 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux]
- Rails
6.1.7.7

__システム依存関係__
- @babel/plugin-proposal-private-methods@7.18.6
- @babel/plugin-proposal-private-property-in-object@7.21.11
- @rails/actioncable@6.1.7
- @rails/activestorage@6.1.7
- @rails/ujs@6.1.7
- @rails/webpacker@5.4.4
- bootstrap@4.6.2
- jquery@3.7.1
- popper.js@1.16.1
- turbolinks@5.2.0
- webpack-cli@3.3.12
- webpack-dev-server@3.11.3
- webpack@4.47.0


## Gemのインストール
__deviseのインストール__
```
# Gemfileの最後に1行追記
gem `devise`

# Gemをインストール
$ bundle install

# deviseをインストール
$ rails g devise:install
```

__Kaminariのインストール__
```
# Gemfileの最後に1行追記
gem 'kaminari','~> 1.2.1'

# enum_helpをインストール
$ bundle install

# kaminariの設定ファイルを作成
$ rails g kaminari:config

# kaminariがページャで利用するテンプレートを作成
$ rails g kaminari:views default
```

__enum_help の導入__
```
# Gemfileの最後に1行追記
 gem "enum_help"

# Gemをインストール
$ bundle install
Order
# Orderモデルにenumを定義
enum payment_method:  { credit_card:  0, transfer:  1  }
```

## Git運用ルール

__ブランチについて__

- mainブランチは常にリリース（デプロイ）できるような状態にある
- developブランチを統合ブランチとする
- トピックブランチは全てdevelopブランチから派生させる

|ブランチ名      |役割                        |派生元   |マージ先  |
|----------------|----------------------------|---------|----------|
|main            |公開するものを置くブランチ  |         |　        |
|develop         |開発中のものを置くブランチ  |main     |main      |
|feature-*       |機能追加中に使うブランチ    |develop  |develop   |

__コミットメッセージの記法__

`start:開始`
`finish:終了`
`add:追加`
`update:更新`
`remove:削除`
`fix:不具合修正`

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
