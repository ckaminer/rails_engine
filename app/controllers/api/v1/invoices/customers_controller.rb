class Api::V1::Invoices::CustomersController < ApiBaseController

  def show
    render json:  Invoice.find(params[:id]).customer
  end
end
