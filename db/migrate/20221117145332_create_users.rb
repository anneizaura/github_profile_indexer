class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :url
      t.string :nick_name
      t.string :followers
      t.string :following
      t.string :stars
      t.string :contributions
      t.string :organization
      t.string :location

      t.timestamps
    end
  end
end
