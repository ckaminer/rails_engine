class Api::V1::InvoiceItems::InvoicesController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with InvoiceItem.find(params[:id]).invoice
  end
end
