require "rails_helper"

RSpec.describe Api::V1::InvoiceItems::InvoicesController do
  fixtures :invoices
  fixtures :invoice_items
  describe "GET index" do
    it "can get specific invoice for a given invoice item" do
      invoice = invoices(:one)
      invoice_item = invoice_items(:one)
      get :show, id: invoice_item.id

      expect(response.status).to eq 200

      parsed_invoice = JSON.parse(response.body)

      expect(parsed_invoice["id"]).to eq invoice.id
      expect(parsed_invoice["status"]).to eq invoice.status
    end
  end
end
