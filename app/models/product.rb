class Product < ApplicationRecord
  validates :title, :unity, :image, presence: true
  has_many :promotion_product, dependent: :destroy
  belongs_to :category

  has_one_attached :image
end
