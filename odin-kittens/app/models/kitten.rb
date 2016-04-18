class Kitten < ActiveRecord::Base
  validates :cuteness, inclusion: { in: 1..10,
                                    message: "Must be on a 1-10 scale." }
  validates :softness, inclusion: { in: 1..10,
                                    message: "Must be on a 1-10 scale." }
end
