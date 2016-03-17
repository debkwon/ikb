require 'rails_helper'

RSpec.describe Chart, type: :model do
  context "with valid params" do
    it "passes validations" do
      chart = Chart.new(title:"My New Project", description: "Something awesome!")
      expect(chart).to be_valid
    end
  end
  context "with invalid params"dp
    it "raises an error without title" do
      chart = Chart.new(title: nil)
      chart.valid?
      expect(chart.errors[:title]).to include("can't be blank")
  end
end

end