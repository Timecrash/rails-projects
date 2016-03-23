class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :attendees, through: :invites, dependent: :destroy
  has_many :invites, foreign_key: :attended_event_id, dependent: :destroy
  
  scope :past,   -> { where("date < ?",  Time.now) }
  scope :future, -> { where("date >= ?", Time.now) }
end
