class UserRelatedFieldsOnOrders < ActiveRecord::Migration[5.1]
  def up
    remove_reference :orders, :user
    add_reference :orders, :client, index: true
    add_reference :orders, :photographer, index: true
  end

  def down
    remove_reference :orders, :client
    remove_reference :orders, :photographer
    add_reference :orders, :user
  end
end
