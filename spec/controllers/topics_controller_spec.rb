require 'rails_helper'
include Devise::TestHelpers

RSpec.describe TopicsController, type: :controller do
	before :each do
		@admin = Admin.create(first_name: "Testing ", last_name: "User", email: "testuser@example.com", password: "12345678", password_confirmation: "12345678")
		sign_in @admin
	end

	describe "GET #new" do 
		before { get :new }
		it "succesfully gets topic page" do
			expect(response).to be_success
		end
		it "renders the form template" do
			expect(response).to render_template("new")
		end
		it "assigns @topic" do
			expect(assigns(:topic)).to be_a_new(Topic)
		end
		it "assigns @categories" do
			expect(assigns(:categories)).not_to be_nil
		end
	end

	describe "POST #create" do
		context "valid attributes submitted" do
			before {
			topic_params = { name: "Some Topic Name", category_id: 1}
			post :create, topic: topic_params
			}
			it "successfully creates a new topic" do #test is looking for variable info (@topic.name and @topic.category.name)
				expect(flash[:success]).to be_present
				expect(Topic.count).to eq(1)
			end
		end
	end
end
