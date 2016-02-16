class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :user_id, presence: true
end
