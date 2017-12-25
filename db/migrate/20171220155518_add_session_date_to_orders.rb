class AddSessionDateToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :session_day, foreign_key: false
  end
end
