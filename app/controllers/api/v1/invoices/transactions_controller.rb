class Api::V1::Invoices::TransactionsController < ApiBaseController

  def index
    render json:  Invoice.find(params[:id]).transactions
  end
end
