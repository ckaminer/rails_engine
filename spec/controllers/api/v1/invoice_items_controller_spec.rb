require "rails_helper"

RSpec.describe Api::V1::InvoiceItemsController do
  fixtures :invoice_items
  describe "GET index" do
    it "can get all invoice items" do
      get :index

      expect(response.status).to eq 200

      invoice_items = JSON.parse(response.body)
      expect(invoice_items.count).to eq 2
    end
  end

  describe "GET show" do
    it "can get a single invoice item" do
      invoice_item = invoice_items(:one)
      get :show, id: invoice_item.id

      expect(response.status).to eq 200

      parsed_invoice_item = JSON.parse(response.body)
      expect(parsed_invoice_item["id"]).to eq invoice_item.id
      expect(parsed_invoice_item["quantity"]).to eq invoice_item.quantity
      expect(parsed_invoice_item["unit_price"]).to eq invoice_item.unit_price
      expect(parsed_invoice_item["invoice_id"]).to eq invoice_item.invoice_id
      expect(parsed_invoice_item["item_id"]).to eq invoice_item.item_id
    end
  end
end
