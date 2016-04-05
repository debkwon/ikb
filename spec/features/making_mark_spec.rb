require 'rails_helper'

RSpec.feature "Making mark", :type => :feature do
  admin = FactoryGirl.create(:admin)
  login_as(admin, :scope => :admin, :run_callbacks => false)

  scenario "admin adds a mark to their progress chart" do
    visit "/my_projects/add"
  end
end