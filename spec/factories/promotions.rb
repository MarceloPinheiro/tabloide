FactoryBot.define do
  factory :promotion do
    title { "MyString" }
    description { "MyText" }
    start_promotion { "2021-01-25" }
    end_promotion { "2021-01-25" }
    observation { "MyText" }
  end
end
