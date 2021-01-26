class ChangeUserColumnProfile < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :profile, :integer, :default => 0
  end
end
