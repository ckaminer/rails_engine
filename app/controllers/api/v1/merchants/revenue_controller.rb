class Api::V1::Merchants::RevenueController < ApiBaseController

  def index
    merchant = Merchant.find(params[:id])
    if merchant_params.keys == [:id, :date]
      render json: merchant.revenue_by_date(merchant_params[:date])
    else
      render json: merchant.revenue_of_merchant
    end
  end

  private
    def merchant_params
      params.permit(:id, :date)
    end
end
