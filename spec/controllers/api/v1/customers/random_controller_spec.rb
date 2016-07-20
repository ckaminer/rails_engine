require "rails_helper"

RSpec.describe Api::V1::Customers::RandomController do
  fixtures :customers
  describe "GET show" do
    it "can get a single random customer" do
      get :show

      expect(response.status).to eq 200

      parsed_customer = JSON.parse(response.body)

      expect(parsed_customer.class).to eq Hash
      expect(parsed_customer.keys).to include("id", "first_name", "last_name")
    end
  end
end
