# README
[![Image from Gyazo](https://i.gyazo.com/3d211f1667a4a425a00cb2a640fb7dbc.jpg)](https://gyazo.com/3d211f1667a4a425a00cb2a640fb7dbc)

![nagano cake_logo2](https://github.com/DWC-root-1/nagano_cake/assets/163057625/e6c62ef0-83e5-4eba-a8f5-4cc3f456acd3)

## サービスの概要・背景
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト。
元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。

## 通販について
- 通販では注文に応じて製作する受注生産型としています。
- 現在通販での注文量は十分に対応可能な量のため、1日の受注量に制限は設けていません。
- 送料は１配送につき全国一律８００円。
- 友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送することができます。
- 支払い方法はクレジットカード、銀行振込から選択できます。

## 実装機能
__顧客側__
|機能名|説明|非ログイン時利用可否|
|-------|--------|-------|---------|
|ログイン機能|メールアドレス、パスワードでログインできる。<br>ログイン時のみ利用できる機能が利用可能になる。|○|
|ログアウト機能|ログインしている状態からログアウト状態にする。<br>ログイン時のみ利用できる機能が利用できなくなる。|×|
|商品一覧表示機能|・商品を一覧表示する。<br>・検索結果を表示する場合は、検索条件に当てはまる商品のみ一覧表示する。|○|
|商品詳細情報表示機能|・商品一覧画面で選択した商品の詳細情報を表示する。<br>・カート追加機能が表示されている。|○|
|カート追加機能|・カートに商品を追加することができる。|×|
|カート一覧機能|・カートの中身を一覧表示することができる。|×|
|カート編集機能|・カートの中身の個数を編集したり、削除したりすることができる。|×|
|注文機能|・カートの中身の購入をすることができる。<br>・支払い方法や発送先を設定することができる。|×|
|会員情報編集機能|・登録している情報を編集することができる。|×|
|退会機能|・退会手続きをすることができる。|×|
|配送先追加・編集機能|・登録している配送先を一覧で確認することができる。<br>・配送先の新規追加・修正・削除をすることができる。|×|
|注文履歴一覧表示機能|・過去の注文概要を一覧で確認することができる。|×|
|注文履歴詳細表示機能|・注文の詳細（注文商品や個数など）を確認することができる。|×|

__管理者側__
|機能名|説明|非ログイン時利用可否|
|-------|--------------|-------|---------|
|ログイン機能|・メールアドレス、パスワードでログインできる。<br>・ログイン時のみ利用できる機能が利用できるようになる。|○|
|ログアウト機能|・ログインしている状態からログアウト状態にする。<br>・ログイン時のみ利用できる機能が利用できなくなる。|×|
|注文履歴一覧表示機能|・過去の注文概要を一覧で確認することができる。|×|
|注文履歴詳細表示機能|・注文の詳細（注文商品や個数など）を確認することができる。<br>・注文ステータス、製作ステータスを変更することができる。|×|
|顧客一覧表示機能|・顧客情報を一覧で確認することができる。<br>・検索結果を表示する場合は、検索条件に当てはまる顧客のみ一覧表示する。|×|
|顧客詳細情報表示機能|・顧客の詳細情報を確認することができる。<br>・顧客のステータス（有効/退会）を切り替えることができる。|×|
|商品一覧表示機能|・登録商品を一覧で確認することができる。<br>・検索結果を表示する場合は、検索条件に当てはまる商品のみ一覧表示する。|×|
|商品詳細情報表示機能|・商品の詳細情報を確認することができる|×|
|商品情報変更機能|・商品の登録情報を変更することができる。<br>・販売ステータスを変更することができる。|×|
|ジャンル設定機能|・ジャンルの追加・変更・ステータス切り替えを行うことができる。|×|

## 使用方法
__インストール__

$ git clone [https://github.com/DWC-root-1/nagano_cake](https://github.com/DWC-root-1/nagano_cake)
$ cd nagano_cake
$ bundle install
$ rails db:migrate
$ rails db:seed
$ rails s

__テスト__
ターミナル（もしくはコマンドプロンプト）で上記の作業を実施後、ローカルサーバーでご確認ください。

```
【管理者用アカウント】
URL：/admin/sign_in
メールアドレス：admin@admin
パスワード：testpass
```
```
【顧客用アカウント】
URL：/customers/sign_in
メールアドレス：test@test
パスワード：testpass
（新規会員登録画面にて新規登録も可能です。）
```

## 外部ドキュメント
- 設計書
[![Image from Gyazo](https://i.gyazo.com/bfd5292ff0caf890d0b0ab6d3e6799b5.png)](https://gyazo.com/bfd5292ff0caf890d0b0ab6d3e6799b5)

- ER図
[![Image from Gyazo](https://i.gyazo.com/354b288c70042159db4c54f3d7696fb8.png)](https://gyazo.com/354b288c70042159db4c54f3d7696fb8)

- スケジュール管理表
[![Image from Gyazo](https://i.gyazo.com/6517a59ad2eaac2068635aee57bad4f5.png)](https://gyazo.com/6517a59ad2eaac2068635aee57bad4f5)

 ## 使用言語
- HTML&CSS
- Ruby（ 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux]）
- Javascript
- フレームワーク
Ruby on Rails（6.1.7.7）

__nodeバージョン__
 - node v20.11.1
 - npm v10.4.0

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

## Gem
 - bootstrap
 - devise
 - jquery-rails
 - kaminari
 - refile, require: "refile/rails", github: 'manfe/refile'
 - refile-mini_magick
 - pry-byebug


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

|ブランチ名       |役割                      |派生元  |マージ先  |
|----------------|-------------------------|-------|---------|
|main            |公開するものを置くブランチ  |        |　       |
|develop         |開発中のものを置くブランチ  |main    |main     |
|feature/*       |機能追加中に使うブランチ    |develop |develop  |

__コミットメッセージの記法__

`start:開始`
`finish:終了`
`add:追加`
`update:更新`
`remove:削除`
`fix:不具合修正`


## 作成者
チーム名【root-1】
メンバー
- 大森さらら（もっりー）
- 鴇矢寛幸（とっきー）
- 伊藤瑞希（みっきー）
- 吉田智哉（よっしー）
