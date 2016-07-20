class Api::V1::CustomersController < ApiBaseController

  def index
    render json: Customer.all
  end

  def show
    render json: Customer.find(params[:id])
  end

end
