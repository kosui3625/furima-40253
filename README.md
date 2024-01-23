# テーブル設計

## users テーブル

| Column                   | Type   | Options     |
| ------------------------ | ------ | ----------- |
| first_name               | string | null: false |
| family_name              | string | null: false |
| first_name_hiragana      | string | null: false |
| family_name_hiragana     | string | null: false |
| nickname                 | string | null: false |
| address                  | string | null: false |
| email                    | string | null: false, unique: true |
| encrypted_password       | string | null: false |
| date_id                  | string | null: false |



### Association

- has_many :items, through: :buy
- has_many :buys



## items テーブル

| Column           | Type         | Options     |
| ---------------- | ------------ | ----------- |
| name             | string       | null: false |
| price            | integer      | null: false |
| comment          | text         | null: false |
| postage_id       | active_hash  | null: false |
| item_explain_id  | string       | null: false |
| user_name        | string       | null: false, foreign_key: true |
| category_id      | string       | null: false |
| take_id          | string       | null: false |


### Association

- has_many :user
- belongs_to :buy

## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user_first_name    | string     | null: false |
| user_family_name   | string     | null: false |
| add_number         | string     | null: false |
| prefecture_id      | string     | null: false |
| city               | string     | null: false, foreign_key: true |
| home_number        | string     | null: false, foreign_key: true |
| building_name      | string     | foreign_key: true |
| phone_number       | string     | null: false, foreign_key: true |



### Association

- has_many :item
- has_many :user
- belongs_to :buy



## buys テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false, foreign_key: true |
| item_image         | string | null: false, foreign_key: true |
| item_price         | string | null: false, foreign_key: true |
| item_user_nickname | string | null: false, foreign_key: true |



### Association

- belongs_to :item
- has_many :user
- belongs_to :order
