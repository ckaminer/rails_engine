class AddInvoiceIdToInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    add_column :invoice_items, :invoice_id, :integer
  end
end
