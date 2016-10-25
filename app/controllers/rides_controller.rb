class RidesController < ApplicationController

  def create
    ride = Ride.create(user_id: session[:user_id], attraction_id: params[:attraction_id])
    ride.take_ride
    flash[:notice] = ride.flash
    redirect_to user_path(session[:user_id])
  end

end
