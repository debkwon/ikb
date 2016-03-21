require 'rails_helper'

RSpec.describe Chart, type: :model do
      it "passes validations" do
        chart = Chart.new(title:"My New Project", description: "Something awesome!", goal_date: "2015-04-01")
        expect(chart).to be_valid
      end

      it "raises an error without title" do
        chart = Chart.new(title: nil)
        chart.valid?
        expect(chart.errors[:title]).to include("can't be blank")
      end
      it "raises an error without goal date" do
        chart = Chart.new(goal_date: nil)
        chart.valid?
        expect(chart.errors[:title]).to include("can't be blank")
      end
  end
