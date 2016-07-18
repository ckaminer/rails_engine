class Updateinvoiceidintransactions < ActiveRecord::Migration[5.0]
  def change
    remove_column :transactions, :invoices_id
    add_column :transactions, :invoice_id, :integer
  end
end
