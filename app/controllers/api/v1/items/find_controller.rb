class Api::V1::Items::FindController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Item.where(item_params)
  end

  def show
    respond_with Item.find_by(item_params)
  end

  private

    def item_params
      params.permit(:id, :name, :description, :unit_price, :created_at, :updated_at)
    end
end