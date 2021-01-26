class AddColumnToPromotionProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :promotion_products, :info, :text
  end
end
