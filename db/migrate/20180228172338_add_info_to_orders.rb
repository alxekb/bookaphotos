class AddInfoToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :i_want_to_get_info, :boolean
    add_column :orders, :i_accept_term, :boolean
    add_column :orders, :i_consent_personal_data, :boolean
  end
end
