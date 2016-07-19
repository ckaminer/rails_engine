require "rails_helper"

RSpec.describe Api::V1::Merchants::FindController do
  fixtures :merchants
  describe "GET index" do
    it "can get all merchants searched for" do
      merchant = merchants(:one)
      get :index, name: merchant.name

      expect(response.status).to eq 200

      parsed_merchants = JSON.parse(response.body)

      expect(parsed_merchants.count).to eq 1
      expect(parsed_merchants.first["name"]).to eq merchant.name
    end
  end

  describe "GET show" do
    it "can get a single merchant based on search" do
      merchant = merchants(:two)
      get :show, name: merchant.name

      expect(response.status).to eq 200

      parsed_merchant = JSON.parse(response.body)

      expect(parsed_merchant["id"]).to eq merchant.id
      expect(parsed_merchant["name"]).to eq merchant.name
    end
  end
end
