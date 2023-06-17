class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.integer :user_id
      t.string :name
      t.text :introduction
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :star
      t.timestamps
    end
  end
end
