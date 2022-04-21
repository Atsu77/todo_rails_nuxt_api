FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    sequence(:uid) { |n| "#{n}" }
  end
end
