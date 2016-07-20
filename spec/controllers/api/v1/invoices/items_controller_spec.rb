require "rails_helper"

RSpec.describe Api::V1::Invoices::ItemsController do
  fixtures :invoices
  fixtures :items
  describe "GET index" do
    it "can get all items for a given invoice" do
      invoice = invoices(:one)
      get :index, id: invoice.id

      expect(response.status).to eq 200

      parsed_items = JSON.parse(response.body)

      expect(parsed_items.count).to eq 2
    end
  end
end
