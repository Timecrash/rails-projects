class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |a| [a.name, a.id] }
    @dates    = Flight.all_dates
    
    find_flights if params[:search]
  end
  
  def show
  end
  
  private
  
  def find_flights
    @flights = Flight.where(departing: params[:from],
                            arriving:  params[:to],
                            takeoff:   correct_date(params[:date]))
  end

  def correct_date(date)
    unless date.nil?
      date = date.to_date
      date.beginning_of_day..date.end_of_day
    end
  end
end
