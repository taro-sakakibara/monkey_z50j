# Monkey.z50j
## アプリケーション概要
monkey.z50jは時間帯ごとにトップページの表示が切り変わる写真投稿アプリです。</br>
投稿内容は写真とテキストで、ユーザーはカテゴリーを選択して投稿を行います。そして、投稿内容はカテゴリーに応じた時間帯にトップページにランダムで表示されます。表示される投稿数は各時間帯ごとに１つのみで、アーカイブは表示されません。

## 開発状況
開発環境</br>
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code</br>
開発期間と平均作業時間</br>
開発期間：12/7~12/17(10日間)</br>
1日あたりの平均作業時間：5</br>
合計：50時間程度</br>

## 接続先情報
https://monkey-z50j.herokuapp.com/</br>
ID/Pass</br>
ID: admin</br>
Pass: 2222</br>

## テスト用アカウント
ユーザーネーム:taro</br>
メールアドレス:taro@taro</br>
パスワード:0000taro</br>

ユーザーネーム:jiro</br>
メールアドレス:jiro@jiro</br>
パスワード:0000jiro</br>

## 利用方法
新規登録を行うことで、アプリの閲覧、投稿、コメントを行うことができます。
登録を行わないユーザーも閲覧は可能です。

## 目指した課題解決
本アプリケーションでは下記の２点の課題の仮説を検証しました。</br>
1.SNSや動画投稿サイトのアーカイブを見過ぎてしまう</br>
2.運動や食事などの良いとされる生活習慣を継続することができない。</br>

1.に関しては、アーカイブを表示させず、一つの投稿しか見れないことで、アーカイブを見続ける習慣を無くすことを目指しました。</br>
実際に使用してみることで、満足ができるのか検証しました。</br>

2.に関しては、時間帯に応じたカテゴリーと同じ行動を取ることで、良い習慣を身につけることを目指しました。

## 洗い出した要件
・ユーザー管理機能</br>
・投稿機能</br>
・マイページ機能</br>
・投稿削除機能</br>
・時間帯による画面切り替え機能</br>
・コメント機能</br>
・投稿一覧機能</br>
・投稿画像トリミング機能</br>
・プロフィール画像表示機能</br>

## 実装した機能
・ユーザー管理機能</br>
・投稿機能</br>
・マイページ機能</br>
・投稿削除機能</br>
・時間帯による画面切り替え機能</br>

## 実装予定の機能
・コメント機能</br>
・投稿一覧機能</br>
・投稿画像トリミング機能</br>
・プロフィール画像表示機能</br>
・時間帯パーソナライズ機能</br>
・ビューのレスポンシブ対応</br>

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
1.画面右上より新規登録を行い、ユーザー登録を行う※全項目必須</br>
2.画面下部の＋ボタンより、新規投稿を行う。</br>
3.投稿は各カテゴリーの時間帯ごとに、全ての投稿者の全ての投稿からランダムに一つ表示される。</br>