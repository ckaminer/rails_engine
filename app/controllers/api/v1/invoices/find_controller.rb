class Api::V1::Invoices::FindController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Invoice.where(invoice_params)
  end

  def show
    respond_with Invoice.find_by(invoice_params)
  end

  private

    def invoice_params
      params.permit(:id, :status, :created_at, :updated_at)
    end
end