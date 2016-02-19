require 'rails_helper'

RSpec.describe Category, type: :model do
	it "raises an error when there's no name"
	category = Category.new(name:nil)
	expect{ category.save!}.to raise_error(ActiveRecord::RecordInvalid)
end
