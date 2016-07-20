class Api::V1::Items::InvoiceItemsController < ApiBaseController

  def index
    render json: Item.find(params[:id]).invoice_items
  end

end
