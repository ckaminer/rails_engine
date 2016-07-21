require "rails_helper"

RSpec.describe Api::V1::Items::BusinessController do
  fixtures :items
  fixtures :invoice_items
  fixtures :invoices
  describe "GET best day" do
    it "can get the date with the most sales for the given item" do
      item = items(:two)
      invoice = invoices(:one)
      get :best_day, id: item.id

      expect(response.status).to eq 200

      parsed_date = JSON.parse(response.body)
      formatted_date = Date.parse(parsed_date).to_s

      expect(formatted_date).to eq invoice.created_at.strftime("%Y-%m-%e")
    end
  end
end
