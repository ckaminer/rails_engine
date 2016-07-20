require "rails_helper"

RSpec.describe Api::V1::Invoices::MerchantsController do
  fixtures :invoices
  fixtures :merchants
  describe "GET index" do
    it "can get all merchants for a given invoice" do
      invoice = invoices(:one)
      merchant = merchants(:two)
      get :show, id: invoice.id

      expect(response.status).to eq 200

      parsed_merchant = JSON.parse(response.body)

      expect(parsed_merchant["name"]).to eq merchant.name
    end
  end
end
