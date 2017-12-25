class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.references :photosession, foreign_key: true
      t.references :user, foreign_key: true
      t.decimal :price
      t.integer :status

      t.timestamps
    end
  end
end
