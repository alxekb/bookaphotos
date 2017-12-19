class CreateSessionDays < ActiveRecord::Migration[5.1]
  def change
    create_table :session_days do |t|
      t.references :photo_session, foreign_key: true
      t.datetime :when
      t.boolean :special
      t.decimal :price

      t.timestamps
    end
  end
end
