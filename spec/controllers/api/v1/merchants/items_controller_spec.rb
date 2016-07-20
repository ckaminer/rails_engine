require "rails_helper"

RSpec.describe Api::V1::Merchants::ItemsController do
  fixtures :merchants
  fixtures :items
  describe "GET index" do
    it "can get all items for a given merchant" do
      merchant = merchants(:one)
      get :index, id: merchant.id

      expect(response.status).to eq 200

      parsed_items = JSON.parse(response.body)

      expect(parsed_items.count).to eq 2
    end
  end
end
