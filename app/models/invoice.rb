class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many   :transactions
  has_many   :invoice_items
  has_many   :items, through: :invoice_items

  scope :pending, -> { joins(:transactions).where(transactions: { result: 'failed' }) }

  def self.random_id
    pluck(:id).shuffle.pop
  end
end
