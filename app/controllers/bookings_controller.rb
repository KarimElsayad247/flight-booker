class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build
    params[:num_passengers].to_i.times do
      @booking.passengers.build
    end
  end

  def create
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = @flight.bookings.build(booking_params)
    if @booking.save
      flash[:notice] = "Booking complete! Please check your email"
      @booking.passengers.each do |passenger|
        PassengerMailer.with(passenger: passenger)
                       .booking_mail.deliver_later
      end
      redirect_to booking_path(@booking)
    else
      flash[:alert] = "Error booking"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id,
        passengers_attributes: [:name, :email]
    )
  end
end
