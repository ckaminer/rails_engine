class Api::V1::Items::BusinessController < ApiBaseController

  def best_day
    item = Item.find(params[:id])
    render json: item.best_day
  end

end
