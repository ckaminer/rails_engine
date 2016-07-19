class Api::V1::Merchants::ItemsController < ApiBaseController
  respond_to :json, :xml

  def index
    merchant = Merchant.find(params[:id])
    respond_with merchant.items
  end
end