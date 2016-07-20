require "rails_helper"

RSpec.describe Api::V1::Items::RandomController do
  fixtures :items
  describe "GET show" do
    it "can get a single random item" do
      get :show

      expect(response.status).to eq 200

      parsed_item = JSON.parse(response.body)

      expect(parsed_item.class).to eq Hash
      expect(parsed_item.keys).to include("id", "name", "description", "unit_price", "merchant_id")
    end
  end
end
