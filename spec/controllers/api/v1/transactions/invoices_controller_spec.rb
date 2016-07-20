require "rails_helper"

RSpec.describe Api::V1::Transactions::InvoicesController do
  fixtures :transactions
  fixtures :invoices
  describe "GET show" do
    it "can get an invoice for a given transaction" do
      transaction = transactions(:one)
      invoice = invoices(:one)
      get :show, id: transaction.id

      expect(response.status).to eq 200

      parsed_invoice = JSON.parse(response.body)

      expect(parsed_invoice["status"]).to eq invoice.status
      expect(parsed_invoice["customer"]).to eq invoice.customer
      expect(parsed_invoice["merchant"]).to eq invoice.merchant
    end
  end
end
