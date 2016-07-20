class Api::V1::InvoiceItems::ItemsController < ApiBaseController

  def show
    render json: InvoiceItem.find(params[:id]).item
  end
end
