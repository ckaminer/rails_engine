class Api::V1::Merchants::InvoicesController < ApiBaseController
  respond_to :json, :xml

  def index
    merchant = Merchant.find(params[:id])
    respond_with merchant.invoices
  end
end
