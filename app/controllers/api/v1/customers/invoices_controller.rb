class Api::V1::Customers::InvoicesController < ApiBaseController
  respond_to :json, :xml

  def index
    customer = Customer.find(params[:id])
    respond_with customer.invoices
  end
end
