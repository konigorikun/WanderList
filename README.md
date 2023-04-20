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
| place                     | string     | null: false                    |
| content                   | text       |                                |
| public                    | string     | null: false                    |
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