class CreatePhotoSessionAdditionalOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_session_additional_options do |t|
      t.references :photo_session, foreign_key: true
      t.references :additional_option, foreign_key: true
      t.decimal :price

      t.timestamps
    end
  end
end
