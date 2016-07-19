class Api::V1::Merchants::FindController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Merchant.where(merchant_params)
  end

  def show
    respond_with Merchant.find_by(merchant_params)
  end

  private

    def merchant_params
      params.permit(:id, :name, :created_at, :updated_at)
    end
end
