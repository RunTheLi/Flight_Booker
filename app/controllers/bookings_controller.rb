class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight: @flight)

    params[:passengers].to_i.times { @booking.passengers.build }
  end

  def create
  end
end
