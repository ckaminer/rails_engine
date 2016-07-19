class Api::V1::Cusotmers::RandomController < ApiBaseController
  respond_to :json, :xml

  def show
    rand_id = rand(Customer.count)
    respond_with Customer.find(rand_id)
  end

end
