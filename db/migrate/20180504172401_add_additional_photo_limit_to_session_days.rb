class AddAdditionalPhotoLimitToSessionDays < ActiveRecord::Migration[5.1]
  def change
    add_column :session_days, :additional_photos_limit, :integer
  end
end
