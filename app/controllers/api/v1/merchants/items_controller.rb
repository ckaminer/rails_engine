class Api::V1::Merchants::ItemsController < ApiBaseController

  def index
    merchant = Merchant.find(params[:id])
    render json: merchant.items
  end
end
