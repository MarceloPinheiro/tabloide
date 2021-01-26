class CreatePromotions < ActiveRecord::Migration[6.1]
  def change
    create_table :promotions do |t|
      t.string :title
      t.text :description
      t.date :start_promotion
      t.date :end_promotion
      t.text :observation

      t.timestamps
    end
  end
end
