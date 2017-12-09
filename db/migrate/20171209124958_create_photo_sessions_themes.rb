class CreatePhotoSessionsThemes < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_sessions_themes do |t|
      t.references :photo_session, foreign_key: true
      t.references :theme, foreign_key: true

      t.timestamps
    end
  end
end
