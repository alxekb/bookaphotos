class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.references :user, foreign_key: false
      t.string :name
      t.text :how_to_find
      t.text :address
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
