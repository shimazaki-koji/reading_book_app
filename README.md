# README
## usersテーブル
| Column             | Type    | Option                    |
| ------------------ | ------- | ------------------------- |
| email              | string  | unique: true, null: false |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| last_name          | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name         | string  | null: false               |
| first_name_kana    | string  | null: false               |

### Association
- has_many : books
- has_many : comments
- has_many : orders

## booksテーブル
| Column   | Type       | Option            |
| -------- | ---------- | ----------------- |
| title    | string     | null: false       |
| image    | text       |                   |
| learn    | text       | null: false       |
| contents | string     | null: false       |
| user     | references | foreign_key: true |

### Association
- has_many    :wrap_up
- has_many   :comments
- belongs_to :user

## wrap_upテーブル
| Column      | Type       | Option            |
| ----------- | ---------- | ----------------- |
| write_down  | text       | null: false       |
| wrap_up     | text       | null: false       |
| impressions | text       | null: false       |
| action_plan | text       | null: false       |
| price       | integer    | null: false       |
| book        | references | foreign_key: true |

### Association
- has_one    :orders
- belongs_to :book

## commentsテーブル
| Column | Type       | Option            |
| ------ | ---------- | ----------------- |
| text   | text       | null: false       |
| user   | references | foreign_key: true |
| book   | references | foreign_key: true |


### Association
- belongs_to :user
- belongs_to :book

## ordersテーブル
| Column  | Type       | Option            |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| wrap_up | references | foreign_key: true |


### Association
- belongs_to :user
- belongs_to :wrap_up