# テーブル設計

## users テーブル

| Column                   | Type   | Options     |
| ------------------------ | ------ | ----------- |
| first_name               | string | null: false |
| family_name              | string | null: false |
| first_name_hiragana      | string | null: false |
| family_name_hiragana     | string | null: false |
| nickname                 | string | null: false |
| email                    | string | null: false, unique: true |
| encrypted_password       | string | null: false |
| birth                    | date   | null: false |



### Association

- has_many :items
- has_many :buys



## items テーブル

| Column                    | Type         | Options     |
| ------------------------- | ------------ | ----------- |
| name                      | string       | null: false |
| price                     | integer      | null: false |
| comment                   | text         | null: false |
| postage_id                | integer      | null: false |
| item_explain_id           | integer      | null: false |
| prefecture_id             | references   | null: false, foreign_key: true |
| user                      | references   | null: false, foreign_key: true |
| category_id               | integer      | null: false |
| take_id                   | integer      | null: false |


### Association

- belongs_to :users
- as_many :buy

## orders テーブル

| Column                   | Type        | Options     |
| ------------------------ | ----------- | ----------- |
| client_name              | string      | null: false |
| add_number               | string      | null: false |
| prefecture_id            | integer     | null: false |
| city                     | string      | null: false |
| home_number              | string      | null: false |
| building_name            | references  | foreign_key: true |
| phone_number             | string      | null: false |
| buy                      | references  | null: false, foreign_key: true |


### Association

- belongs_to :buy



## buys テーブル

| Column                     | Type        | Options     |
| -------------------------- | ----------- | ----------- |
| item                       | references   | null: false, foreign_key: true |
| user                       | references   | null: false, foreign_key: true |



### Association

- belongs_to :item
- belongs_to :user
- has_one :buy

