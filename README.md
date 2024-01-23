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
| name                      | string       | null: false | ## 商品名
| price                     | integer      | null: false | ## 商品価格
| comment                   | text         | null: false | ## 説明
| postage_id                | integer      | null: false | ## 発送料
| item_explain_id           | integer      | null: false | ## 商品の状態
| prefecture_id             | integer      | null: false, foreign_key: true | ## 発送元
| user                      | references   | null: false, foreign_key: true | ## ユーザーの外部カラム
| category_id               | integer      | null: false | ## カテゴリー
| take_id                   | integer      | null: false | ## 発送までの日数


### Association

- belongs_to :user
- has_many :buy

## orders テーブル

| Column                   | Type        | Options     |
| ------------------------ | ----------- | ----------- |
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

