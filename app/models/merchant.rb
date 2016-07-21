class Merchant < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices
  has_many :items

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
end
