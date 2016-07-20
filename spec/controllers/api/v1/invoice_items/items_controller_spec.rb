require "rails_helper"

RSpec.describe Api::V1::InvoiceItems::ItemsController do
  fixtures :items
  fixtures :invoice_items
  describe "GET index" do
    it "can get specific item for a given invoice item" do
      item = items(:two)
      invoice_item = invoice_items(:one)
      get :show, id: invoice_item.id

      expect(response.status).to eq 200

      parsed_item = JSON.parse(response.body)

      expect(parsed_item["id"]).to eq item.id
      expect(parsed_item["name"]).to eq item.name
      expect(parsed_item["description"]).to eq item.description
    end
  end
end
