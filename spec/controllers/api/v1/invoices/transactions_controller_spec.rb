require "rails_helper"

RSpec.describe Api::V1::Invoices::TransactionsController do
  fixtures :invoices
  fixtures :transactions
  describe "GET index" do
    it "can get all transactions for a given invoice" do
      invoice = invoices(:one)
      get :index, id: invoice.id

      expect(response.status).to eq 200

      parsed_transactions = JSON.parse(response.body)

      expect(parsed_transactions.count).to eq 2
    end
  end
end
