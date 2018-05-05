class RemoveRedundantFieldFromPhotoSessions < ActiveRecord::Migration[5.1]
  def up
    remove_column :photo_sessions, :price
    remove_column :photo_sessions, :price_per_photo
    remove_column :photo_sessions, :how_route
    remove_column :photo_sessions, :how_find
    remove_column :photo_sessions, :lat
    remove_column :photo_sessions, :lng
  end

  def down
    add_column :photo_sessions, :price, :decimal
    add_column :photo_sessions, :price_per_photo, :decimal
    add_column :photo_sessions, :how_route, :text
    add_column :photo_sessions, :how_find, :text
    add_column :photo_sessions, :lat, :string
    add_column :photo_sessions, :lng, :string
  end
end
