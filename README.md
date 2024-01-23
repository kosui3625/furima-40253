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
| date                     | data   | null: false |



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
| item_explain_id  | active_hash  | null: false |
| users_name       | data         | null: false, foreign_key: true |
| category_id      | active_hash  | null: false |
| take_id          | active_hash  | null: false |


### Association

- belongs_to :user
- belongs_to :buy

## orders テーブル

| Column                   | Type       | Options     |
| ------------------------ | ---------- | ----------- |
| users_first_name         | string     | null: false |
| users_family_name        | string     | null: false |
| add_number               | string     | null: false |
| users_prefecture_id      | string     | null: false, foreign_key: true |
| city                     | string     | null: false, foreign_key: true |
| home_number              | string     | null: false, foreign_key: true |
| building_name            | string     | foreign_key: true |
| phone_number             | string     | null: false, foreign_key: true |



### Association

- belongs_to :item
- has_many :users
- belongs_to :buy



## buys テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| item_name              | string | null: false, foreign_key: true |
| user_nickname          | data   | null: false, foreign_key: true |




### Association

- belongs_to :item
- belongs_to :user

