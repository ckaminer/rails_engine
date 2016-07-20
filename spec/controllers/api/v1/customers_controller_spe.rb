require "rails_helper"

RSpec.describe Api::V1::CustomersController do
  fixtures :customers
  describe "GET index" do
    it "can get all customers" do
      get :index

      expect(response.status).to eq 200

      customers = JSON.parse(response.body)
      expect(customers.count).to eq 2
    end
  end

  describe "GET show" do
    it "can get a single customer" do
      customer = customers(:one)
      get :show, id: customer.id

      expect(response.status).to eq 200

      parsed_customer = JSON.parse(response.body)
      expect(parsed_customer["first_name"]).to eq merchant.first_name
      expect(parsed_customer["last_name"]).to eq merchant.last_name
    end
  end
end
