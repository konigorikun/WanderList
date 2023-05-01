# アプリケーション名

WanderList

# アプリケーション概要

旅行した場所やこれからしたい場所を検索したり、保存できる。またコメントし、コミュニケーションが取れるようにします。
友達とシェアして、旅行するためのスケジュールを立てることができるようにします。

# URL

https://wanderlist.onrender.com

# Basic認証

・Basic認証ID : admin
・Basic認証パスワード : 2222

# アプリケーションを作成した背景

過去に友達と旅行をする際に、「気になった場所などをすぐに保存したい。目的地やその場所でやりたい事がすぐに決まらない。スケジュールが決まらない」という課題があることが判明しました。課題を分析した結果、簡単に保存やマイナーな情報の取得、また友達とのスケジュール管理を共有できるようなアプリケーションをがあれば、友達やカップルが楽しく旅行できると思い、開発することにしました。


# 洗い出した要件

https://docs.google.com/spreadsheets/d/1PKg7P3iw5zB7DHe419S0CmVVLzU4Q7V0prVxPrZ4Cvs/edit#gid=179850172

# これから実装予定の機能

現在は投稿の詳細画面を実装中
これから機能としてコメント機能やスケジュール機能、地図閲覧など随時作成、実装します。

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/46d0ae78feb6782449ec454e52ad67c4.png)](https://gyazo.com/46d0ae78feb6782449ec454e52ad67c4)


# テーブル設計

## users テーブル

| Column             | Type     | Options                    |
| ------------------ | -------- | -------------------------- |
| email              | string   | null: false,  unique: true |
| encrypted_password | string   | null: false                |
| nickname           | string   | null: false                |

### Association

- has_many :posts 
- has_many :comments
- has_many :schedules
- has_many :favorites
- has_many :likes
- has_many :relationships
- has_many :followeds, through: :relationships

## posts テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| category_id               | integer    | null: false                    |
| place                     | string     | null: false                    |
| content                   | text       |                                |
| public_id                 | integer    | null: false                    |
| user                      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_many   :favorites
- has_many   :likes

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| post        | references | null: false, foreign_key: true |
| schedule    | references | null: false, foreign_key: true |

### Association

- belongs_to :user 
- belongs_to :post
- belongs_to :schedule

## schedules テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| start_date | date       |                                |
| end_date   | date       |                                |
| budget     | integer    |                                |
| user       | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_many   :comments
- has_many   :favorites
- has_many   :schedule_details

## schedule_details テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| date_time      | time       |                                |
| place          | string     |                                |
| transportation | string     |                                |
| detail         | text       | null: false                    |
| schedule       | references | null: false, foreign_key: true |

### Association
- belongs_to :schedule

## likes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| post   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post

## favorites テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| post     | references | null: false, foreign_key: true |
| schedule | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post
- belongs_to :schedule


## followeds テーブル

| Column             | Type     | Options                    |
| ------------------ | -------- | -------------------------- |
| email              | string   | null: false,  unique: true |
| encrypted_password | string   | null: false                |
| nickname           | string   | null: false                |

### Association
- has_many :relationships
- has_many :users, through: :relationships

## relationships テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| followed | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :followed