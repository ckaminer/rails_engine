require "rails_helper"

RSpec.describe Api::V1::Items::MerchantsController do
  fixtures :items
  fixtures :merchants
  describe "GET index" do
    it "can get all merchants for a given item" do
      item = items(:one)
      merchant = merchants(:one)
      get :show, id: item.id

      expect(response.status).to eq 200

      parsed_merchant = JSON.parse(response.body)

      expect(parsed_merchant["name"]).to eq merchant.name
    end
  end
end
