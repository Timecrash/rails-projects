class Flight < ActiveRecord::Base
  belongs_to :departing, class_name: "Airport"
  belongs_to :arriving,  class_name: "Airport"
  has_many :bookings
  
  def self.all_dates
    dates = Flight.all.order(takeoff: :asc)
    dates.map { |x| x.takeoff.strftime("%A, %B %e, %Y") }.uniq
  end
end
