class Chart < ActiveRecord::Base
  has_many :marks
  validates :title, presence: true
  validates :goal_date, presence: true
  
  attr_reader :chart_creator

  def chart_creator(chart_id)
    chart = Chart.find[chart_id]
    first_name = Admin.find[chart.creator_id].first_name
    last_initial = Admin.find[chart.creator_id].last_name[0]
    "#{first_name} #{last_initial.capitalize}."
  end
end
