class Booking < ActiveRecord::Base
  has_many :passenger_bookings
  has_many :passengers, through: :passenger_bookings
  belongs_to :flight
  accepts_nested_attributes_for :passengers
end
