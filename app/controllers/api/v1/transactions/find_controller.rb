class Api::V1::Transactions::FindController < ApiBaseController

  def index
    render json: Transaction.where(item_params)
  end

  def show
    render json: Transaction.find_by(item_params)
  end

  private

    def item_params
      params.permit(:id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at, :invoice_id)
    end
end
