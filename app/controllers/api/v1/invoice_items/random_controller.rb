class Api::V1::InvoiceItems::RandomController < ApiBaseController
  respond_to :json, :xml

  def show
    rand_id = rand(InvoiceItem.count)
    respond_with InvoiceItem.find(rand_id)
  end
end
