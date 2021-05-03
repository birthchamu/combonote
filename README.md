# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null:false               |
| email              | string | null:false, unique: true |
| encrypted_password | string | null:false               |

### Association

- has_many :combos
- has_many :favorites
- has_many :comments

## combos テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| start_percent | string     | null:false                    |
| combo_route   | string     | null:false, unique: true      |
| memo          | text       |                               |
| rate          | float      |                               |
| user          | references | null:false, foreign_key: true |
| fighter       | references | null:false, foreign_key: true |


### Association

- has_many :favorites
- has_many :comments
- belongs_to :user

## comments テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| comment_text | string     | null:false                    |
| combo        | references | null:false, foreign_key: true |
| user         | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :combo


