class Api::V1::Merchants::CustomersController < ApiBaseController

  def index
    merchant = Merchant.find(params[:id])
    render json: merchant.customers_with_pending_invoices
  end

  def show
    merchant = Merchant.find(params[:id])
    render json: merchant.favorite_customer
  end
end
