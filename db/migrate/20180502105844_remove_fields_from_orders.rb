class RemoveFieldsFromOrders < ActiveRecord::Migration[5.1]
  def up
    remove_column :orders, :name
    remove_column :orders, :email
    remove_column :orders, :phone
  end
end
