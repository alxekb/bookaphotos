class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: false
      t.references :photo_session, foreign_key: false

      t.timestamps
    end
  end
end
