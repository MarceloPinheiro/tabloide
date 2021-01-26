FactoryBot.define do
  factory :promotion_product do
    promotion { nil }
    product { nil }
    price { "9.99" }
    discount { "9.99" }
    special { "9.99" }
  end
end
