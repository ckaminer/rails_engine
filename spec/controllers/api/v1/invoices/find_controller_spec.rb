require "rails_helper"

RSpec.describe Api::V1::Invoices::FindController do
  fixtures :invoices
  describe "GET index" do
    it "can get all invoices searched for" do
      invoice = invoices(:one)
      get :index, status: invoice.status

      expect(response.status).to eq 200

      parsed_invoices = JSON.parse(response.body)

      expect(parsed_invoices.count).to eq 2
    end
  end

  describe "GET show" do
    it "can get a single invoice based on search" do
      invoice = invoices(:two)
      get :show, status: invoice.status

      expect(response.status).to eq 200

      parsed_invoice = JSON.parse(response.body)

      expect(parsed_invoice["id"]).to eq invoice.id
      expect(parsed_invoice["status"]).to eq invoice.status
      expect(parsed_invoice["customer_id"]).to eq invoice.customer_id
      expect(parsed_invoice["merchant_id"]).to eq invoice.merchant_id
    end
  end
end
