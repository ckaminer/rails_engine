class Item < ApplicationRecord
  belongs_to :merchant
  has_many   :invoice_items
  has_many   :invoices, through: :invoice_items

  def self.random_id
    pluck(:id).shuffle.pop
  end

  def best_day
    invoice_items.joins(:invoice)
                 .group("invoices.created_at")
                 .order("sum_invoice_items_quantity DESC, invoices_created_at DESC")
                 .sum("invoice_items.quantity").first.first
  end
end
