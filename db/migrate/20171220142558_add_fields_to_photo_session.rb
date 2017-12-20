class AddFieldsToPhotoSession < ActiveRecord::Migration[5.1]
  def change
    add_column :photo_sessions, :duration, :integer
    add_column :photo_sessions, :photos_count, :integer
    add_column :photo_sessions, :period_of_execution, :integer
  end
end
