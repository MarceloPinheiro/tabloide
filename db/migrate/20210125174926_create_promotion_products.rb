class CreatePromotionProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :promotion_products do |t|
      t.references :promotion, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.decimal :price
      t.decimal :discount
      t.decimal :special

      t.timestamps
    end
  end
end
