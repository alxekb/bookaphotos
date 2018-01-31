class AddPricePerPhotoToPhotoSessions < ActiveRecord::Migration[5.1]
  def change
    add_column :photo_sessions, :price_per_photo, :decimal
  end
end
