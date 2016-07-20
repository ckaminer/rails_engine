class Api::V1::Merchants::RevenueController < ApiBaseController

  def index
    merchant = Merchant.find(params[:id])
    render json: merchant.revenue_of_merchant
  end

  private
    def merchant_params
      params.permit(:id)
    end
end
