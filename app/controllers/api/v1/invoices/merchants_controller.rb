class Api::V1::Invoices::MerchantsController < ApiBaseController

  def show
    render json:  Invoice.find(params[:id]).merchant
  end
end
