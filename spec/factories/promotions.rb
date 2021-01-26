FactoryBot.define do
  factory :promotion do
    title { Faker::Name.name }
    description { Faker::Lorem.sentence }
    start_promotion { Date.today }
    end_promotion { Date.today + 5.days }
    observation { "MyText" }
  end
end
