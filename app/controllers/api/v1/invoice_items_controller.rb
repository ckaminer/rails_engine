class Api::V1::InvoiceItemsController < ApiBaseController

  def index
    render json: InvoiceItem.all
  end

  def show
    render json: InvoiceItem.find(params[:id])
  end

end
