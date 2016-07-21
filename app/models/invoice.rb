class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many   :transactions
  has_many   :invoice_items
  has_many   :items, through: :invoice_items

  scope :pending, -> { joins(:transactions).having("COUNT(NULLIF( transactions.result = 'success', FALSE)) = 0").group(:id) }

  def self.random_id
    pluck(:id).shuffle.pop
  end
end
