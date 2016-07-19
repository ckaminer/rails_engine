class Api::V1::Merchants::RandomController < ApiBaseController
  respond_to :json, :xml

  def show
    rand_id = rand(Merchant.count)
    respond_with Merchant.find(rand_id)
  end

end
