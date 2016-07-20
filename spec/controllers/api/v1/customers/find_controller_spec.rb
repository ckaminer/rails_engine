require "rails_helper"

RSpec.describe Api::V1::Customers::FindController do
  fixtures :customers
  describe "GET index" do
    it "can get all customers searched for" do
      customer = customers(:one)
      get :index, first_name: customer.first_name

      expect(response.status).to eq 200

      parsed_customers = JSON.parse(response.body)

      expect(parsed_customers.count).to eq 1
      expect(parsed_customers.first["first_name"]).to eq customer.first_name
    end
  end

  describe "GET show" do
    it "can get a single customer based on search" do
      customer = customers(:two)
      get :show, first_name: customer.first_name

      expect(response.status).to eq 200

      parsed_customer = JSON.parse(response.body)

      expect(parsed_customer["id"]).to eq customer.id
      expect(parsed_customer["first_name"]).to eq customer.first_name
    end
  end
end
