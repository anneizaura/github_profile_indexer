class AddImageToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :img, :string
  end
end
