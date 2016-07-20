class Api::V1::InvoiceItems::InvoicesController < ApiBaseController

  def show
    render json: InvoiceItem.find(params[:id]).invoice
  end
end
