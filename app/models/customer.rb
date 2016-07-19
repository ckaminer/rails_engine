class Customer < ApplicationRecord
  has_many :invoices

  def transactions
    invoices.map do |invoice|
      invoice.transactions
    end
  end
end
