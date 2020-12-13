class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '今日の散歩' },
    { id: 3, name: '今日のコーヒー' },
    { id: 4, name: '今日のランチ' },
    { id: 5, name: '今日の休憩' },
    { id: 6, name: '今日の成果' },
    { id: 7, name: '今日のお風呂' },
    { id: 8, name: '今日の睡眠' }
  ]

  include ActiveHash::Associations
  has_many :tweets
end
