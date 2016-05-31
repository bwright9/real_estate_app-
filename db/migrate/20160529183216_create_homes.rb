class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.integer :square_feet
      t.string :beds
      t.string :baths
      t.string :home_type
      t.integer :price
      t.integer :price
      t.boolean :active

      t.timestamps null: false
    end
  end
end
