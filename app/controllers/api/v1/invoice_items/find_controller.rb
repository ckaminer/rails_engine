class Api::V1::InvoiceItems::FindController < ApiBaseController
  before_action :convert_to_integer

  def index
    render json: InvoiceItem.where(invoice_item_params)
  end

  def show
    render json: InvoiceItem.find_by(invoice_item_params)
  end

  private

    def invoice_item_params
      params.permit(:id, :quantity, :unit_price, :created_at, :updated_at, :invoice_id, :item_id)
    end

    def convert_to_integer
      params[:unit_price] = ((params[:unit_price].to_f) * 100).to_i if params[:unit_price]
    end
end
