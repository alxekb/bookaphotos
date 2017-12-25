class CreateCitiesPhotoSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :cities_photo_sessions do |t|
      t.references :city, foreign_key: false
      t.references :photo_session, foreign_key: false

      t.timestamps
    end
  end
end
