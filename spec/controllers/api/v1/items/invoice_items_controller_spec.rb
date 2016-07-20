require "rails_helper"

RSpec.describe Api::V1::Items::InvoiceItemsController do
  fixtures :items
  fixtures :invoice_items
  describe "GET index" do
    it "can get all invoice items for a given item" do
      item = items(:one)
      get :index, id: item.id

      expect(response.status).to eq 200

      parsed_invoice_items = JSON.parse(response.body)

      expect(parsed_invoice_items.count).to eq 2
    end
  end
end
