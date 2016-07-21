class Api::V1::Merchants::RevenueController < ApiBaseController

  def index
    merchant = Merchant.find(params[:id])
    if merchant_params[:date]
      render json: merchant.revenue_by_date(merchant_params[:date]), serializer: RevenueSerializer
    else
      render json: merchant.revenue_of_merchant, serializer: RevenueSerializer
    end
  end

  def total_date
    render json: Merchant.total_revenue_by_date(params[:date]), serializer: TotalRevenueSerializer
  end

  def most_revenue
    render json: Merchant.ranked_by_revenue(params[:quantity])
  end

  private
    def merchant_params
      params.permit(:id, :date)
    end
end
