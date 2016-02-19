require 'rails_helper'
include Devise::TestHelpers

RSpec.describe CategoriesController, type: :controller do
	before :each do
		@admin = Admin.create(first_name: "Testing ", last_name: "User", email: "testuser@example.com", password: "12345678", password_confirmation: "12345678")
		sign_in @admin
	end

	describe "GET #new" do 
		before { get :new }
		it "assigns @category" do
			expect(assigns(:category)).to be_a_new(Category)
		end
		it "gets the new category form" do
			expect(response).to be_success
		end
		it "renders the form template" do
			expect(response).to render_template("new")
		end
	end

	describe "POST #create" do
		context "valid attributes submitted" do
			before {
			category_params = { name: "Category Name"}
			post :create, category: category_params
			}
			it "successfully creates a category" do
				expect(flash[:success]).to be_present
				expect(Category.count).to eq(1)
			end
		end
	end
end
