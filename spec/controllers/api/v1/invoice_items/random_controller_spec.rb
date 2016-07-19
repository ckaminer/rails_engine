require "rails_helper"

RSpec.describe Api::V1::InvoiceItems::RandomController do
  fixtures :invoice_items
  describe "GET show" do
    it "can get a single random invoice item" do
      get :show

      expect(response.status).to eq 200

      parsed_invoice_item = JSON.parse(response.body)

      expect(parsed_invoice_item.class).to eq Hash
      expect(parsed_invoice_item.keys).to include("id", "quantity", "unit_price", "invoice_id", "item_id")
    end
  end
end
