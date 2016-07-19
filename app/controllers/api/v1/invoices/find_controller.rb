class Api::V1::Invoices::FindController < ApiBaseController

  def index
    render json: Invoice.where(invoice_params)
  end

  def show
    render json: Invoice.find_by(invoice_params)
  end

  private

    def invoice_params
      params.permit(:id, :status, :created_at, :updated_at)
    end
end
