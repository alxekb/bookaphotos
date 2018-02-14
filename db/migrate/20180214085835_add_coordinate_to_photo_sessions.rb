class AddCoordinateToPhotoSessions < ActiveRecord::Migration[5.1]
  def change
    add_column :photo_sessions, :lat, :string
    add_column :photo_sessions, :lng, :string
  end
end
