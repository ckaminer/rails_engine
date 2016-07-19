class Api::V1::Customers::TransactionsController < ApiBaseController
  respond_to :json, :xml

  def index
    customer = Customer.find(params[:id])
    respond_with customer.transactions
  end
end
