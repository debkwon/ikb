require 'rails_helper'

RSpec.feature "Project creation", :type => :feature do
  admin = FactoryGirl.create(:admin)
  login_as(admin, :scope => :admin, :run_callbacks => false)
  
  scenario "Admin creates a new project" do
    visit "/charts/new"

    fill_in "Title", :with => "Some Title"
    fill_in "Description", :with => "My Description"
    fill_in "Goal date", :with => "2015-04-01 00:00:00"
    click_button "Start!"

    expect(page).to have_text("You're off to a great start!")
  end
end
