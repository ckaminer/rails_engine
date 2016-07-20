class Api::V1::Items::MerchantsController < ApiBaseController

  def show
    render json: Item.find(params[:id]).merchant
  end

end
