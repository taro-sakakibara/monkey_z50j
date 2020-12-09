# Monkey.z50j
## 概要
monkey.z50jはアーカイブの表示はしない、かつ、時間帯ごとにトップページの表示が変わる写真投稿アプリです。
投稿内容は写真とテキストで、ユーザーはカテゴリーを選択して投稿を行います。そして、投稿内容はカテゴリーに応じた時間帯にトップページにランダムで表示されます。表示される投稿数は各時間帯ごとに１つのみです。

## URL
https://monkey-z50j.herokuapp.com/

## テスト用アカウント

## 利用方法
新規登録を行うことで、アプリの閲覧、投稿、コメントを行うことができます。
登録を行わないユーザーも閲覧は可能です。

## 目指した課題解決
本アプリケーションでは下記の２点の課題の解決を目指しました。
1.毎日のちょっとした楽しみや、日々の習慣に飽きてしまう。
2.心身のために良いとされる、基本的な習慣の継続ができない。

## 洗い出した要件


## 実装した機能

## 実装予定の機能

## データベース設計
### usersテーブル
| Colunmn            | Type            | Options           |
| ------------------ | --------------- | ----------------- |
| nickname           | string          | null: false       |
| email              | string          | null: false       |
| encrypted_password | string          | null: false       |
| birthday           | date            | null: false       |
| profile            | text            | null: false       |

#### Association
- has_many :tweets
- has_many :comments
- has_one_attached :image

### tweetsテーブル
| Colunmn            | Type            | Options           |
| ------------------ | --------------- | ----------------- |
| text               | text            | null: false       |
| category_id        | integer         | null: false       |
| user               | references      | foreign_key: true |

#### Association
- belongs_to :user
- has_many :comments
- has_one_attached :image

### commentsテーブル
| Colunmn            | Type            | Options           |
| ------------------ | --------------- | ----------------- |
| text               | text            | null: false       |
| user               | references      | foreign_key: true |
| tweet              | references      | foreign_key: true |

#### Association
- belongs_to :user
- belongs_to :tweet

## ローカルでの動作方法