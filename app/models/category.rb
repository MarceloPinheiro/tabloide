class Category < ApplicationRecord
  validates :title, presence: true

  has_many :product, dependent: :destroy
end
