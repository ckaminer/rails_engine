class Api::V1::Invoices::MerchantsController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with  Invoice.find(params[:id]).merchant
  end
end
