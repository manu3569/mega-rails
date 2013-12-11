class Api::V2::CustomersController < ApiController

  def index
    render json: { customers: [], total_count: 0, request_time: Time.now }
  end
end
