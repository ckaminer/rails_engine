require "rails_helper"

RSpec.describe Api::V1::Merchants::CustomersController do
  fixtures :merchants
  fixtures :customers
  fixtures :transactions
  fixtures :invoices
  describe "GET index" do
    it "can return a collection of customers with pending invoices" do
      merchant = merchants(:three)
      get :index, id: merchant.id

      expect(response.status).to eq 200

      parsed_customers = JSON.parse(response.body)

      expect(parsed_customers.count).to eq 1
      expect(parsed_customers.pluck("first_name")).to include("Cersei")
    end
  end

  describe "GET show" do
    it "can return the customer who has conducted the most successful transactions" do
      merchant = merchants(:one)
      get :show, id: merchant.id

      expect(response.status).to eq 200

      parsed_customer = JSON.parse(response.body)

      expect(parsed_customer["first_name"]).to eq "John"
      expect(parsed_customer["last_name"]).to eq "Snow"
    end
  end
end
