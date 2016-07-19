require "rails_helper"

RSpec.describe Api::V1::MerchantsController do
  fixtures :merchants
  describe "GET index" do
    it "can get all items" do
      get :index

      expect(response.status).to eq 200

      merchants = JSON.parse(response.body)
      expect(merchants.count).to eq 2
    end
  end

  describe "GET show" do
    it "can get a single merchant" do
      merchant = merchants(:one)
      get :show, id: merchant.id

      expect(response.status).to eq 200

      parsed_item = JSON.parse(response.body)
      expect(parsed_item["name"]).to eq merchant.name
    end
  end
end
