require "rails_helper"

RSpec.describe Api::V1::Merchants::MostItemsController do

    describe "GET most sold" do
      fixtures :merchants
      fixtures :transactions
      fixtures :invoices
      fixtures :invoice_items
        it "can get top quantity of merchants ranked by most items sold" do
          merchant1 = merchants(:one)
          merchant2 = merchants(:two)
          get :index, quantity: 2

          expect(response.status).to eq 200

          parsed_merchants = JSON.parse(response.body)

          expect(parsed_merchants.length).to eq 2

        end
      end


end
