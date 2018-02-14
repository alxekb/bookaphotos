class AddInfoToPhotoSessions < ActiveRecord::Migration[5.1]
  def change
    add_column :photo_sessions, :for_whom, :text
    add_column :photo_sessions, :preparation, :text
    add_column :photo_sessions, :what_to_take, :text
    add_column :photo_sessions, :how_route, :text
    add_column :photo_sessions, :how_find, :text
  end
end
