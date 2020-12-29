class CreateUserAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_addresses do |t|
      t.string :postal_code,          null: false
      t.integer :prefecture_id,       null: false
      t.string :city,                 null: false
      t.string :address,                 null: false
      t.string :building_name
      t.timestamps
    end
  end
end