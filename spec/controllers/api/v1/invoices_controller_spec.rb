require "rails_helper"

RSpec.describe Api::V1::InvoicesController do
  fixtures :invoices
  describe "GET index" do
    it "can get all invoices" do
      get :index

      expect(response.status).to eq 200

      invoices = JSON.parse(response.body)
      expect(invoices.count).to eq 5
    end
  end

  describe "GET show" do
    it "can get a single invoice" do
      invoice = invoices(:one)
      get :show, id: invoice.id

      expect(response.status).to eq 200

      parsed_invoice = JSON.parse(response.body)
      expect(parsed_invoice["status"]).to eq invoice.status
      expect(parsed_invoice["customer_id"]).to eq invoice.customer_id
      expect(parsed_invoice["merchant_id"]).to eq invoice.merchant_id
    end
  end
end
