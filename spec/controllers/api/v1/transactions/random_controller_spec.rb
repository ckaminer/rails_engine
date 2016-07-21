require "rails_helper"

RSpec.describe Api::V1::Transactions::RandomController do
  fixtures :transactions
  describe "GET show" do
    it "can get a single random transaction" do
      get :show

      expect(response.status).to eq 200

      parsed_merchant = JSON.parse(response.body)

      expect(parsed_merchant.class).to eq Hash
      expect(parsed_merchant.keys).to include("credit_card_number", "result")
    end
  end
end
