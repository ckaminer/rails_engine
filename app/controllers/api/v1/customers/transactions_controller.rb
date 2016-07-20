class Api::V1::Customers::TransactionsController < ApiBaseController

  def index
    customer = Customer.find(params[:id])
    render json: customer.transactions
  end
end
