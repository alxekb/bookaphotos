class AddTypeFieldsToPhotoSession < ActiveRecord::Migration[5.1]
  def up
    remove_column :session_days, :special
    add_column :photo_sessions, :session_type, :integer, default: 0
  end

  def down
    remove_column :photo_sessions, :session_type
    add_column :session_days, :special, :boolean
  end
end
