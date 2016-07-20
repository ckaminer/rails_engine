class Api::V1::Customers::RandomController < ApiBaseController

  def show
    rand_id = Customer.random_id
    render json: Customer.find(rand_id)
  end

end
