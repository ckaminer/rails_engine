require "rails_helper"

RSpec.describe Api::V1::Customers::TransactionsController do
  fixtures :customers
  fixtures :transactions
  describe "GET index" do
    it "can get all transactions for a given customer" do
      customer = customers(:one)
      get :index, id: customer.id

      expect(response.status).to eq 200

      parsed_transactions = JSON.parse(response.body)

      expect(parsed_transactions.count).to eq 2
    end
  end
end
