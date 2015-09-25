class TripsController < ApplicationController
  before_action :find_trip, except: [:index]

  def index
    render_success Trip.all
  end

  def show
    render_success @trip
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      render_success @trip
    else
      render_error("Trip creation failed", 500)
    end
  end

  def update
  end

  def destroy
    @trip.destroy
    render_success
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
