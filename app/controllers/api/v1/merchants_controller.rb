class Api::V1::MerchantsController < ApiBaseController

  def index
    render json: Merchant.all
  end

  def show
    render json: Merchant.find(params[:id])
  end

end
