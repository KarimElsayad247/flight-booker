class PassengerMailer < ApplicationMailer
  default from: "booking@example.com"

  def booking_mail
    @passenger = params[:passenger]
    mail(to: @passenger.email, subject: "Your Flight is booked")
  end
end
