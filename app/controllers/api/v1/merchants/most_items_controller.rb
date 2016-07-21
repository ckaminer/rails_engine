class Api::V1::Merchants::MostItemsController < ApiBaseController

  def index
      render json: Merchant.most_items_sold(most_sold_params[:quantity].to_i)
  end

  private
    def most_sold_params
      params.permit(:quantity)
    end
end
