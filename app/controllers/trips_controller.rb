class TripsController < ApplicationController
  before_action :find_trip, except: [:index]

  def show
    render_success @trip
  end

  def signup
    @trip.signup(current_user)
    render_success
  end

  private

  def find_trip
    @trip = Trip.find(params[:id])
  end

end
