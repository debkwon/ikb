require 'rails_helper'

Rspec.describe MarksController, type: :controller do 
  let!(:admin) { login_admin }
    describe "GET #new" do
      before { get :new }
        it "assigns chart" do
          expect(:chart).to be_a_new(:chart)
        end
        it "gets the page succesfully" do
          expect(response).to be_success
        end
        it "renders the form template" do
          expect(response).to render_template("new")
      end
    end

end