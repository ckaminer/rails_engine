class Api::V1::Transactions::RandomController < ApiBaseController
  respond_to :json, :xml

  def show
    rand_id = rand(Transaction.count)
    respond_with Transaction.find(rand_id)
  end
end
