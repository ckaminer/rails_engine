require "rails_helper"

RSpec.describe Api::V1::Invoices::RandomController do
  fixtures :invoices
  describe "GET show" do
    it "can get a single random invoice" do
      get :show

      expect(response.status).to eq 200

      parsed_invoice = JSON.parse(response.body)

      expect(parsed_invoice.class).to eq Hash
      expect(parsed_invoice.keys).to include("id", "status", "customer_id", "merchant_id")
    end
  end
end
