class AddSessionDateToOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :session_date, foreign_key: true
  end
end
