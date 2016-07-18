class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.string :status
      t.references :customers, foreign_key: true
      t.references :merchants, foreign_key: true

      t.timestamps
    end
  end
end
