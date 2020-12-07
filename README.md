# Monkey.z50-j
## 概要

## URL

## テスト用アカウント

## 利用方法

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
- has_many :contents
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