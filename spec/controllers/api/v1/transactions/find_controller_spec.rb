require "rails_helper"

RSpec.describe Api::V1::Transactions::FindController do
  fixtures :transactions
  describe "GET index" do
    it "can get all transactions searched for" do
      transaction = transactions(:one)
      get :index, credit_card_number: transaction.credit_card_number

      expect(response.status).to eq 200

      parsed_transactions = JSON.parse(response.body)

      expect(parsed_transactions.count).to eq 1
    end
  end

  describe "GET show" do
    it "can get a single transaction based on search" do
      transaction = transactions(:two)
      get :show, result: transaction.result

      expect(response.status).to eq 200

      parsed_transaction = JSON.parse(response.body)

      expect(parsed_transaction["id"]).to eq transaction.id
      expect(parsed_transaction["credit_card_number"]).to eq transaction.credit_card_number
      expect(parsed_transaction["result"]).to eq transaction.result
      expect(parsed_transaction["invoice_id"]).to eq transaction.invoice_id
    end
  end
end
