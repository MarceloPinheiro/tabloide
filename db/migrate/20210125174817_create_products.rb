class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :ean
      t.string :unity
      t.string :image

      t.timestamps
    end
  end
end
