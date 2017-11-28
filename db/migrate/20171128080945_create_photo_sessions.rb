class CreatePhotoSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_sessions do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.references :user, foreign_key: true
      t.boolean :published

      t.timestamps
    end
  end
end
