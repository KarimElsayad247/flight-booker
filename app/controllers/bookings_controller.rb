class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build
    params[:num_passengers].to_i.times do
      @booking.passengers.build
    end
  end

  def create

  end
end
