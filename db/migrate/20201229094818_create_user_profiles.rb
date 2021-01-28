class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.string :first_name,         null: false
      t.string :last_name,          null: false
      t.string :first_name_kana,    null: false
      t.string :last_name_kana,     null: false
      t.date :birthday,             null: false
      t.text :introduction
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
