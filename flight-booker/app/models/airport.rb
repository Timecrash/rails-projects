class Airport < ActiveRecord::Base
  has_many :departing_flights, class_name: "Flight", foreign_key: :departing_id
  has_many :arriving_flights,  class_name: "Flight", foreign_key: :arriving_id
  validates :code, presence: true, length: { is: 3 }
  validates :name, presence: true
end
