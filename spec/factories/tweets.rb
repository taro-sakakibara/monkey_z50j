FactoryBot.define do
  factory :tweet do
    category_id { 2 }
    text { SecureRandom.alphanumeric(140) }
    association :user
    after(:build) do |tweet|
      tweet.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
