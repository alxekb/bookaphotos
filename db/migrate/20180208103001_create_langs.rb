class CreateLangs < ActiveRecord::Migration[5.1]
  def change
    create_table :langs do |t|
      t.string :title

      t.timestamps
    end
  end
end
