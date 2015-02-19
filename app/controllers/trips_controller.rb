class TripsController < ActionController::Base

  def show
    binding.pry
    unless request.session['cas']
      render json: nil, status: :unauthorized
      return
    end
    @trip = Trip.find(params[:id]).to_json
    render json: @trip
  end


end
