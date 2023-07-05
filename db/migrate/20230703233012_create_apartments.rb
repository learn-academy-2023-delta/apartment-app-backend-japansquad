class CreateApartments < ActiveRecord::Migration[7.0]
  def change
    create_table :apartments do |t|
      t.string :street
      t.string :unit
      t.string :prefecture
      t.string :city
      t.integer :square_footage
      t.float :price
      t.integer :bedrooms
      t.float :bathrooms
      t.string :pets
      t.string :amenities
      t.text :image
      t.integer :user_id

      t.timestamps
    end
  end
end
