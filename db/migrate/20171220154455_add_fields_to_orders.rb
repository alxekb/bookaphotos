class AddFieldsToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :name, :string
    add_column :orders, :phone, :string
    add_column :orders, :email, :string
    add_column :orders, :comment, :text
  end
end
