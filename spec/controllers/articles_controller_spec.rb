require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
	let!(:admin) { login_admin }

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

	describe "GET #change" do
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
			it "creates a new article" do 
				post :create, article: attributes_for(:article)
				expect(Article.count).to eq(1)
			end
			it "flashes a notice of a succesfully added article" do
				post :create, article: attributes_for(:article)
				expect(flash[:success]).to eq("Your article has been saved!")
			end
			it "redirects to the article just created" do
				post :create, article: attributes_for(:article)
				expect(:article).to redirect_to(assigns(:article))
			end
		end

		context "invalid or missing params" do
			it "will render article form for missing title" do
				post :create, article: attributes_for(:missing_title)
				expect(:article).to render_template("new")
			end
			it "will render article form for missing category" do
				post :create, article: attributes_for(:missing_category)
				expect(:article).to render_template("new")
			end
			it "will render article form for missing topic" do
				post :create, article: attributes_for(:missing_topic)
				expect(:article).to render_template("new")
			end
			it "will render article form for missing everything " do
				post :create, article: attributes_for(:missing_everything)
				expect(:article).to render_template("new")
			end
		end
	end

	describe "PATCH #update" do
		context "" do
			it "" do
			end
		end
	end
end
