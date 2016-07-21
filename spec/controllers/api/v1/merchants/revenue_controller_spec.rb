require "rails_helper"

RSpec.describe Api::V1::Merchants::RevenueController do
  fixtures :merchants
  fixtures :transactions
  fixtures :invoices
  fixtures :invoice_items
  describe "GET index" do
    it "can get total revenue for a single merchant" do
      merchant = merchants(:one)
      get :index, id: merchant.id

      expect(response.status).to eq 200
      search = merchant.revenue_of_merchant

      expect(search).to eq 32
    end
  end

  describe "GET index" do
    it "can get total revenue for a single merchant by date" do
      merchant = merchants(:one)
      date = "2012-05-27 14:53:59"
      get :index, id: merchant.id, date: date

      expect(response.status).to eq 200
      search = merchant.revenue_by_date(date)

      expect(search).to eq 42
    end
  end

  describe "GET total_date" do
    it "can get total revenue for all merchants by date" do
      date = "2012-05-27 14:53:59"
      get :total_date, date: date

      expect(response.status).to eq 200

      parsed_revenue = JSON.parse(response.body)

      expect(parsed_revenue["total_revenue"]).to eq "0.42"
    end
  end

  describe "GET ranked_revenue" do
    it "can get list of merchants ranked by revenue of specified length" do
      quantity = 2
      get :most_revenue, quantity: quantity

      expect(response.status).to eq 200

      parsed_merchants = JSON.parse(response.body)

      expect(parsed_merchants.length).to eq 2

      expect(parsed_merchants.first["name"]).to eq "Cubby Stuffers"
    end
  end
end
