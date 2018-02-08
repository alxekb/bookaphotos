class CreateLangsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :langs_users do |t|
      t.references :lang, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
