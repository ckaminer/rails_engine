require "rails_helper"

RSpec.describe Api::V1::Merchants::InvoicesController do
  fixtures :merchants
  fixtures :invoices
  describe "GET index" do
    it "can get all invoices for a given merchant" do
      merchant = merchants(:one)
      get :index, id: merchant.id

      expect(response.status).to eq 200

      parsed_invoices = JSON.parse(response.body)

      expect(parsed_invoices.count).to eq 4
    end
  end
end
