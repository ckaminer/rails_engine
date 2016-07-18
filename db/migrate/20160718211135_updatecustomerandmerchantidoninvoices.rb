class Updatecustomerandmerchantidoninvoices < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoices, :customers_id
    remove_column :invoices, :merchants_id
    add_column :invoices, :customer_id, :integer
    add_column :invoices, :merchant_id, :integer
  end
end
