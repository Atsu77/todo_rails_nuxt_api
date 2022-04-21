FactoryBot.define do
  factory :todo do
    name { Faker::Lorem.sentence }
    user    
  end
end
