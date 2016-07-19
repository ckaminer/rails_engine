class Api::V1::Items::RandomController < ApiBaseController
  respond_to :json, :xml

  def show
    rand_id = rand(Item.count)
    respond_with Item.find(rand_id)
  end
end
