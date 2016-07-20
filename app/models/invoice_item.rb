class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  def self.random_id
    pluck(:id).shuffle.pop
  end
end
