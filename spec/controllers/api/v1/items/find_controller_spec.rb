require "rails_helper"

RSpec.describe Api::V1::Items::FindController do
  fixtures :items
  describe "GET index" do
    it "can get all items searched for" do
      item = items(:one)
      get :index, name: item.name

      expect(response.status).to eq 200

      parsed_items = JSON.parse(response.body)

      expect(parsed_items.count).to eq 2
    end
  end

  describe "GET show" do
    it "can get a single item based on search" do
      item = items(:two)
      get :show, name: item.name

      expect(response.status).to eq 200

      parsed_item = JSON.parse(response.body)

      expect(parsed_item["id"]).to eq item.id
      expect(parsed_item["name"]).to eq item.name
      expect(parsed_item["description"]).to eq item.description
      expect(parsed_item["unit_price"]).to eq (item.unit_price.to_f / 100).to_s
      expect(parsed_item["merchant_id"]).to eq item.merchant_id
    end
  end
end
