class Api::V1::Transactions::RandomController < ApiBaseController

  def show
    rand_id = Transaction.random_id
    render json: Transaction.find(rand_id)
  end
end
