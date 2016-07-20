class Customer < ApplicationRecord
  has_many :invoices

  def transactions
    Transaction.joins(invoice: :customer).where(customers: {id: self.id})
  end

  def self.random_id
    pluck(:id).shuffle.pop
  end
end
