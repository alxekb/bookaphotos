class CreateOrderSelectedOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :order_selected_options do |t|
      t.references :photo_session_additional_option, foreign_key: true, index: { name: "idx_order_selected_option_ps_ao" }
      t.references :order, foreign_key: true, index: { name: "idx_order_selected_option_order" }

      t.timestamps
    end
  end
end
