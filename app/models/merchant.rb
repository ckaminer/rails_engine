class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.random_id
    pluck(:id).shuffle.pop
  end

  def customers_with_pending_invoices
    Customer.joins(:invoices)
            .joins(:merchants)
            .where(merchants: {id: self.id}, invoices: {status: "pending"})
            .distinct
  end

  def favorite_customer
    customers.joins(:transactions).where(transactions: {result: "success"})
             .group(:id)
             .order("COUNT(transactions) DESC").first
  end

  def revenue_of_merchant
    invoices.joins(:transactions, :invoice_items)
            .where(transactions: {result: "success"})
            .sum("invoice_items.unit_price * invoice_items.quantity")
  end
end
