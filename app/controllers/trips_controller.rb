class TripsController < ActionController::Base

  def show
    @trip = Trip.find(params[:id]).to_json
    render json: @trip
  end


end
