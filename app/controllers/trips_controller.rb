class TripsController < ActionController::Base
  before_action :find_trip, only: [:show, :destroy, :update]

  def show
    render json: @trip
  end

  private

  def find_trip
    @trip = Trip.find(params[:id])
  end

end
