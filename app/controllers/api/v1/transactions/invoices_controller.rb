class Api::V1::Transactions::InvoicesController < ApiBaseController

  def show
    transaction = Transaction.find(params[:id])
    render json: transaction.invoice
  end
end
