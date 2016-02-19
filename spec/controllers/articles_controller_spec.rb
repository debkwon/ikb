require 'rails_helper'
include Devise::TestHelpers

RSpec.describe ArticlesController, type: :controller do
	before :each do
		@admin = Admin.create(first_name: "Testing ", last_name: "User", email: "testuser@example.com", password: "12345678", password_confirmation: "12345678")
		sign_in @admin
	end

	describe "GET #index" do
		before { get :index}
		it "assigns all @categories for index" do
			expect(assigns(:categories)).not_to be_nil
		end
		it "gets the index page successfully" do
			expect(response).to be_success
		end
		it "renders the index template" do
			expect(response).to render_template("index")
		end
	end

	describe "GET #new" do 
		before { get :new }
		it "assigns @article" do
			expect(assigns(:article)).to be_a_new(Article)
		end
		it "gets the new article form" do
			expect(response).to be_success
		end
		it "renders the new template" do
			expect(response).to render_template("new")
		end
	end

	describe "GET #directory" do
		before { get :directory }
		it "assigns @categories for full directory" do
			expect(assigns(:categories)).not_to be_nil
		end
		it "gets the directory page successfully" do
			expect(response).to be_success
		end
		it "renders the directory template" do
			expect(response).to render_template("directory")
		end
	end

	describe "get #change" do
		before { get :change }
		it "assigns all articles to @articles" do
			expect(assigns(:articles)).not_to be_nil
		end
		it "gets the change page succesfully" do
			expect(response).to be_success
		end
		it "renders the change template" do
			expect(response).to render_template("change")
		end
	end

	describe "POST #create" do
		context "valid attributes submitted" do
			before {
				article_params = { title: "Article Title", content: "meow.meow.meow", topic_id:1 }
				post :create, article: article_params
			}
			it "successfully creates a new article" do
				expect(Article.count).to eq(1)			
			end
		end
	end
end
