FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { '111aaa' }
    password_confirmation { password }
    birthday { Faker::Date.backward }
    profile { SecureRandom.alphanumeric(140) }
  end
end
