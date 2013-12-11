class Api::V1::CustomersController < ApiController

  def index
    render json: { customers: [] }
  end

end
