require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :customers
  context "it can retrieve associated transactions" do
    it "returns an array of associated transactions" do
      customer = customers(:one)
      expect(customer.transactions.count).to eq 3
    end
  end
end
