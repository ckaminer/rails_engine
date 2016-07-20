class Transaction < ApplicationRecord
  belongs_to :invoice

  def self.random_id
    pluck(:id).shuffle.pop
  end

end
