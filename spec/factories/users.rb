FactoryBot.define do
  factory :user do
    nickname { "satou" }
    email { Faker::Internet.free_email }
    password { "a12345" }
    password_confirmation { password }
  end
end
