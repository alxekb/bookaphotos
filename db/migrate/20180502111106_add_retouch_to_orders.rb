class AddRetouchToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :retouch, :boolean
  end
end
