require 'rails_helper'

RSpec.describe Mark, type: :model do
  it "is valid given all params" do
    mark = Mark.new(attributes_for(:mark))
    expect(:mark).to be_valid
  end

  it "raises an error without date" do
    mark = Mark.new(description: "Some description")
    chart.valid?
    expect(:chart.errors[:date]).to include("can't be blank")
  end
end