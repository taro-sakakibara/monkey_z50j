class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '今日の散歩(表示時間:5時〜7時)' },
    { id: 3, name: '今日のコーヒー(表示時間:8時〜11時)' },
    { id: 4, name: '今日のランチ(表示時間:12時〜13時)' },
    { id: 5, name: '今日の休憩(表示時間:14時〜16時)' },
    { id: 6, name: '今日の成果(表示時間:17時〜19時)' },
    { id: 7, name: '今日のお風呂(表示時間:20時〜22時)' },
    { id: 8, name: '今日の睡眠(表示時間:23時〜4時)' }
  ]

  include ActiveHash::Associations
  has_many :tweets
end
