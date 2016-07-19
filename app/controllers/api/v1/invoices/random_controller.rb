class Api::V1::Invoices::RandomController < ApiBaseController
  respond_to :json, :xml

  def show
    rand_id = rand(Invoice.count)
    respond_with Invoice.find(rand_id)
  end
end
