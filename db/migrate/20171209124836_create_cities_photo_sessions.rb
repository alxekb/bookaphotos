class CreateCitiesPhotoSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :cities_photo_sessions do |t|
      t.references :city, foreign_key: true
      t.references :photo_session, foreign_key: true

      t.timestamps
    end
  end
end
