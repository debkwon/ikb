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

	describe "GET #new" do 
		it "gets the new article form" do
			expect(response).to be_success
		end
		it "renders the form template" do
			get :new
			expect(response).to render_template("new")
		end
	end
end
