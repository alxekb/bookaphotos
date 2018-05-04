class AddPricePerAdditionlPhotoToSessionDays < ActiveRecord::Migration[5.1]
  def up
    add_column :session_days, :price_per_additional_photo, :decimal
  end

  def down
    remove_column :session_days, :price_per_additional_photo
  end
end
