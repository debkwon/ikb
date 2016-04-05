require 'rails_helper'

RSpec.feature "Admin logs in", :type => :feature do
  given!(:admin) { FactoryGirl.create(:admin)}

  scenario 'they visit IKB site and submit credentials' do
    visit root_path
    fill_in "Email", with: admin.email
    fill_in "Password",with: admin.password
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
  end

end