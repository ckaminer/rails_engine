class Api::V1::Merchants::InvoicesController < ApiBaseController

  def index
    merchant = Merchant.find(params[:id])
    render json: merchant.invoices
  end
end
