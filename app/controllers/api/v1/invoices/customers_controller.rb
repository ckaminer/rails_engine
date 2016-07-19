class Api::V1::Invoices::CustomersController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with  Invoice.find(params[:id]).customer
  end
end
