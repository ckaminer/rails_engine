class Api::V1::Items::MerchantsController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with Item.find(params[:id]).merchant
  end

end
