class AddShortUrlToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :short_url, :string
  end
end
