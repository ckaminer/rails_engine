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
    Customer.joins(merchants: :invoices)
            .where(merchants: {id: self.id}).merge(Invoice.pending)
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

  def revenue_by_date(date)
    invoices.where(created_at: date)
            .joins(:invoice_items)
            .sum("invoice_items.unit_price * invoice_items.quantity")
  end

  def self.total_revenue_by_date(date)
    Invoice.where(created_at: date).joins(:invoice_items)
           .sum("invoice_items.unit_price * invoice_items.quantity")
  end

  def self.ranked_by_revenue(quantity)
    joins(:invoice_items)
           .group(:id)
           .order("SUM(invoice_items.unit_price * invoice_items.quantity) DESC")
           .limit(quantity)

    # joins(:invoice_items)
    # .select("SUM invoice_items.unit_price * invoice_items.quantity AS total_revenue")
    # .group(:id)
  end
end
