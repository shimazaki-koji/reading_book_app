# README
## usersテーブル
| Column             | Type    | Option                    |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | unique: true, null: false |
| encrypted_password | string  | null: false               |

### Association
- has_many : books
- has_many : comments
- has_many : orders

## booksテーブル
| Column   | Type       | Option            |
| -------- | ---------- | ----------------- |
| title    | string     | null: false       |
| learn    | text       | null: false       |
| genre    | string     | null: false       |
| user     | references | foreign_key: true |

### Association
- has_many :contents
- belongs_to :user

## contentsテーブル
| Column      | Type       | Option            |
| ----------- | ---------- | ----------------- |
| chapter     | string     | null: false       |
| write_down  | text       | null: false       |
| wrap_up     | text       | null: false       |
| action_plan | text       | null: false       |
| book        | references | foreign_key: true |

### Association
- belongs_to :book
- has_many :comments

## commentsテーブル
| Column | Type       | Option            |
| ------ | ---------- | ----------------- |
| text   | text       | null: false       |
| user   | references | foreign_key: true |
| book   | references | foreign_key: true |


### Association
- belongs_to :user
- belongs_to :content