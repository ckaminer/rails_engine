class Api::V1::Transactions::InvoicesController < ApiBaseController
  respond_to :json, :xml

  def show
    transaction = Transaction.find(params[:id])
    respond_with transaction.invoice
  end
end
