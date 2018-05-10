class AddDropboxTokenToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :dropbox_token, :string
  end
end
