class Api::V1::Invoices::ItemsController < ApiBaseController

  def index
    render json: Invoice.find(params[:id]).items
  end
end
