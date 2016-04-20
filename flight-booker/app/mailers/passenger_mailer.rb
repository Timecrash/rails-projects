class PassengerMailer < ApplicationMailer
  def thank_you(passenger, flight)
    @passenger = passenger
    @flight = flight
    mail(to: @passenger.email, subject: "Thank you for your booking.")
  end
end
