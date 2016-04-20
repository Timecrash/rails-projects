class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    params[:passengers].to_i.times { @booking.passengers.build }
  end
  
  def show
    @booking = Booking.find(params[:id])
    @flight  = Flight.find(@booking.flight_id)
  end
  
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      @booking.passengers.each do |p|
        PassengerMailer.thank_you(p, @booking.flight).deliver_later
      end
      flash[:success] = "Flight successfully booked!"
      redirect_to booking_path(@booking)
    else
      flash[:alert] = "Something went wrong!"
      @flight = Flight.find(params[:booking][:flight_id])
      render 'new'
    end
  end
  
  private
  def booking_params
    params.require(:booking).permit(:flight_id,
                                    passengers_attributes: [:name, :email])
  end
end
