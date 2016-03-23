class User < ActiveRecord::Base
  has_many :events,          foreign_key: :creator_id, dependent: :destroy
  has_many :attended_events, through: :invites, dependent: :destroy
  has_many :invites, foreign_key: :attendee_id, dependent: :destroy
  
  def upcoming_events
      self.attended_events.where("date >= ?", Time.now)
  end
  
  def previous_events
      self.attended_events.where("date < ?", Time.now)
  end
end
