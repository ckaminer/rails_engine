class Api::V1::InvoiceItems::RandomController < ApiBaseController

  def show
    rand_id = InvoiceItem.random_id
    render json: InvoiceItem.find(rand_id)
  end
end
