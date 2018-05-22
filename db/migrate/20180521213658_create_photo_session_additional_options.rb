class CreatePhotoSessionAdditionalOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_session_additional_options do |t|
      t.references :photo_session, foreign_key: true
      t.references :additional_option, foreign_key: true
      t.decimal :price

      t.timestamps
    end
    add_index :photo_session_additional_options, [:photo_session_id, :additional_option_id], unique: true, name: "idx_on_psao_ps_ao_uniq"
  end
end
