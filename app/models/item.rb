class Item < ApplicationRecord
  belongs_to :merchant
  has_many   :invoice_items
  has_many   :invoices, through: :invoice_items

  def self.random_id
    pluck(:id).shuffle.pop
  end

  def best_day
    invoices.joins(:invoice_items)
            .group("invoices.created_at")
            .sum("invoice_items.unit_price * invoice_items.quantity")
            .first.first
  end
end
