class Api::V1::InvoiceItems::FindController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with InvoiceItem.where(invoice_item_params)
  end

  def show
    respond_with InvoiceItem.find_by(invoice_item_params)
  end

  private

    def invoice_item_params
      params.permit(:id, :quantity, :unit_price, :created_at, :updated_at)
    end
end
