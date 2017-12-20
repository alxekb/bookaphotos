class AddPhotoCountToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :photo_count, :integer
  end
end
