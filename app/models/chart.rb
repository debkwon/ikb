class Chart < ActiveRecord::Base
  validates :title, presence: true
  validates :goal_date, presence: true
  
end
