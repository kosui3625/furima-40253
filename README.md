# テーブル設計

## user テーブル

| Column                   | Type   | Options     |
| ------------------------ | ------ | ----------- |
| first_name               | string | null: false |
| family_name              | string | null: false |
| nickname                 | string | null: false |
| address                  | string | null: false |
| email                    | string | null: false, unique: true |
| encrypted_password       | string | null: false |
| birth                    | string | null: false |



### Association

- has_many :item, through: :buy
- has_many :order



## item テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| name          | string | null: false |
| image         | string | null: false foreign_key: true|
| price         | string | null: false |
| comment       | string | null: false |
| postage       | string | null: false |
| item_explain  | string | null: false |
| user_name     | string | null: false |
| show_category | string | null: false |
| take          | string | null: false |


### Association

- belongs_to :user
- belongs_to :order
- belongs_to :buy

## order テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| add_number    | string     | null: false |
| prefecture    | string     | null: false |
| city          | string     | null: false |
| home_number   | string     | null: false |
| building_name | string     | null: false |
| phone_number  | string     | null: false |



### Association

- has_many :item
- has_many :user



## buy テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false |
| item_image         | ------ | ----------- |
| item_price         | ------ | ----------- |
| item_user_nickname | ------ | ----------- |



### Association

- belongs_to :item
