require "rails_helper"

RSpec.describe Api::V1::Customers::InvoicesController do
  fixtures :customers
  fixtures :invoices
  describe "GET index" do
    it "can get all invoices for a given customer" do
      customer = customers(:one)
      get :index, id: customer.id

      expect(response.status).to eq 200

      parsed_invoices = JSON.parse(response.body)

      expect(parsed_invoices.count).to eq 2
    end
  end
end
