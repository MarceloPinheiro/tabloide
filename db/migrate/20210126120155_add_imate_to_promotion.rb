class AddImateToPromotion < ActiveRecord::Migration[6.1]
  def change
    add_column :promotions, :image, :string
  end
end
