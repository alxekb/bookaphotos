class CreatePhotoSessionsThemes < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_sessions_themes do |t|
      t.references :photo_session, foreign_key: false
      t.references :theme, foreign_key: false

      t.timestamps
    end
  end
end
