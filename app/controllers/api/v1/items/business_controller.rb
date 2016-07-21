class Api::V1::Items::BusinessController < ApiBaseController

  def best_day
    item = Item.find(params[:id])
    # byebug
    render json: item.best_day, serializer: DateSerializer
  end

end
