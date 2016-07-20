require "rails_helper"

RSpec.describe Api::V1::Merchants::RandomController do
  fixtures :merchants
  describe "GET show" do
    it "can get a single random merchant" do
      get :show

      expect(response.status).to eq 200

      parsed_merchant = JSON.parse(response.body)

      expect(parsed_merchant.class).to eq Hash
      expect(parsed_merchant.keys).to include("id", "name")
    end
  end
end
