require "rails_helper"

RSpec.describe Api::V1::Merchants::RevenueController do

  describe "GET index" do
    fixtures :merchants
    fixtures :transactions
    fixtures :invoices
    fixtures :invoice_items
      it "can get total revenue for a single merchant" do
        merchant = merchants(:one)
        get :index, id: merchant.id

        expect(response.status).to eq 200
        search = merchant.revenue_of_merchant

        expect(search).to eq 32
      end
    end
end
