class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.references :photosession, foreign_key: false
      t.references :user, foreign_key: false
      t.decimal :price
      t.integer :status

      t.timestamps
    end
  end
end
