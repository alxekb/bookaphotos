class CreateOrderSelectedOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :order_selected_options do |t|
      t.references :photo_session_additional_option, foreign_key: true, index: { name: "idx_order_selected_option_ps_ao" }
      t.references :order, foreign_key: true, index: { name: "idx_order_selected_option_order" }

      t.timestamps
    end
    add_index :order_selected_options, [:photo_session_additional_option_id, :order_id], unique: true, name: "idx_on_oso_ps_ao_o_uniq"
  end
end
