class Api::V1::Items::RandomController < ApiBaseController

  def show
    rand_id = Item.random_id
    render json: Item.find(rand_id)
  end
end
