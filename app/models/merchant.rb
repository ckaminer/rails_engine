class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items

  def self.random_id
    pluck(:id).shuffle.pop
  end
end
