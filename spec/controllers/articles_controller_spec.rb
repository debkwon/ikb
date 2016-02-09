require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
	describe "GET #index" do
		it "gets the index page successfully" do
			expect(response).to be_success
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end
	end
end
