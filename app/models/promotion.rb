class Promotion < ApplicationRecord
  validates :title, presence: true
  validates :start_promotion, :end_promotion, presence: :true, future_date: true
  has_many :promotion_product, dependent: :destroy

  has_many_attached :image
end
