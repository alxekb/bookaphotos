class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.attachment :photo
      t.references :photo_session, foreign_key: false

      t.timestamps
    end
  end
end
