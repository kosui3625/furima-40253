# テーブル設計

## edit テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| address            | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |



### Association

- has_many :show
- has_many :new, through: :index


## new テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| name          | string | null: false |
| image         | string | null: false foreign_key: true|
| price         | string | null: false |
| postage       | string | null: false |
| item_explain  | string | null: false |
| edit_name     | string | null: false |
| show_category | string | null: false |
| take          | string | null: false |


### Association

- belongs_to :index
- belongs_to :show
- belongs_to :edit

## index テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| new_name    | string | null: false foreign_key: true|
| new_image   | string | null: false foreign_key: true|
| new_price   | string | null: false foreign_key: true|
| new_postage | string | null: false foreign_key: true|


### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages


## show テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| new_name          | string | null: false |
| new_image         | string | null: false foreign_key: true|
| new_price         | string | null: false |
| new_postage       | string | null: false |
| new_item_explain  | string | null: false |
| edit_name         | string | null: false |
| show_category     | string | null: false |
| new_take          | string | null: false |

### Association

- belongs_to :edit
- belongs_to :new