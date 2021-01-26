class PromotionProduct < ApplicationRecord
  belongs_to :promotion
  belongs_to :product

  scope :products, lambda { |promotion|
    joins("
      inner join products on products.id=promotion_products.product_id 
      inner join categories on categories.id=products.category_id
      ") 
    .where("promotion_id=?",promotion)
    .select("promotion_products.*")
    .order("categories.title asc, products.title asc")
  }
end
