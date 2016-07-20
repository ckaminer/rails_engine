class Api::V1::Merchants::RandomController < ApiBaseController

  def show
    rand_id = Merchant.random_id
    render json: Merchant.find(rand_id)
  end

end
