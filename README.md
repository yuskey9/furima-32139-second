

## usersテーブル

| Column            | Type    | Options     |
| ------------------| --------| ----------- |
| email             | string  | null: false |
| password          | string  | null: false |
| nickname          | string  | null: false |
| last-name         | string  | null: false |
| first-name        | string  | null: false |
| last-name-kana    | string  | null: false |
| first-name-kana   | string  | null: false |
| birth-date        | integer | null: false |


### Association
- has_many :items
- has_many :orders




## itemsテーブル

| Column                    | Type       | Options           |
| ------------------------- | ---------- | ----------------- |
| item-name                 | text       | null: false       |
| item-info                 | text       | null: false       |
| item-category             | string     | null: false       |
| item-sales-status         | text       | null: false       |
| item-shipping-fee-status  | string     | null: false       |
| item-prefecture           | string     | null: false       |
| item-scheduled-delivery   | string     | null: false       |
| item-price                | integer    | null: false       |
| user                      | references | foreign_key: true |

### Association
 - belongs_to :user




## ordersテーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |


### Association
 - has_one    :shipping address
 - belongs_to :user




## shipping addressテーブル

| Column        | Type       | Options           |
| --------------| ---------- | ----------------- |
| postal-code   | integer    | null: false       |
| prefecture    | string     | null: false       |
| city          | string     | null: false       |
| addresses     | string     | null: false       |
| building      | string     |                   |
| phone-number  | integer    | null: false       |
| order         | references | foreign_key: true |


### Association
 - belongs_to :order