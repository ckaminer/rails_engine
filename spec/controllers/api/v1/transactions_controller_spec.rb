require "rails_helper"

RSpec.describe Api::V1::TransactionsController do
  fixtures :transactions
  describe "GET index" do
    it "can get all transactions" do
      get :index

      expect(response.status).to eq 200

      transactions = JSON.parse(response.body)
      expect(transactions.count).to eq 3
    end
  end

  describe "GET show" do
    it "can get a single transaction" do
      transaction = transactions(:one)
      get :show, id: transaction.id

      expect(response.status).to eq 200

      parsed_transaction = JSON.parse(response.body)
      expect(parsed_transaction["credit_card_number"]).to eq transaction.credit_card_number
      expect(parsed_transaction["result"]).to eq transaction.result
      expect(parsed_transaction["invoice_id"]).to eq transaction.invoice_id
    end
  end
end
