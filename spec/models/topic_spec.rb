require 'rails_helper'

RSpec.describe Topic, type: :model do
  it "raises error when there's no name" do
	    article = Topic.new(name: nil)
	    expect{ topic.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end
  it "raises error when there's no associated category" do
	    article = Topic.new(category_id: nil)
	    expect{ topic.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
