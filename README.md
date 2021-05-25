# アプリ名

ComboNote

# 概要

・コンボの情報をユーザー同士が共有できる。
・ユーザーはコンボの情報を整理し閲覧できる。

# 制作背景

対戦中や対戦の合間に、文字でコンボを確認したいと思ったことがきっかけです。
メモアプリを利用すればいいと思っていたのですが、手動入力が面倒でした。
ネット上にあるコンボをコピー&ペーストしようとしても、多くのコンボの情報は動画形式で掲載されているので困っていました。
文字列で記載されたコンボの情報をユーザーが蓄積し、整理して確認する機能が欲しいと思ったので制作を決めました。

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



