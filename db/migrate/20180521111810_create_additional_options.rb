class CreateAdditionalOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :additional_options do |t|
      t.references :user, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
