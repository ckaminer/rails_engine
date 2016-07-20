require "rails_helper"

RSpec.describe Api::V1::Invoices::CustomersController do
  fixtures :invoices
  fixtures :customers
  describe "GET index" do
    it "can get all customers for a given invoice" do
      invoice = invoices(:one)
      customer = customers(:one)
      get :show, id: invoice.id

      expect(response.status).to eq 200

      parsed_customer = JSON.parse(response.body)

      expect(parsed_customer["first_name"]).to eq customer.first_name
      expect(parsed_customer["last_name"]).to eq customer.last_name
    end
  end
end
