class ArticlesController < ApplicationController
	include ArticlesHelper
	include TopicsHelper
	include CategoriesHelper

	before_action :check_for_search

		def check_for_search
			if params[:search].present?
				@search_results = Article.search(params[:search])
			end
		end

		def index
			@categories = Category.all
		end

		def test_page
			@categories = Category.all
		end

		def directory
			@categories = Category.all
		end

		def new
			@article = Article.new
			@categories = Category.all
			@category_topics = Topic.all #just to generate something for the form
		end

		def update_topics
			@category_topics = Category.find(params[:category_id]).topics
		end

		def create
			@article = Article.new(article_params)
			@current_admin_name = current_admin.first_name + " " + current_admin.last_name
			@article.author = @current_admin_name
			if @article.save
				flash[:success] = "Your article has been saved!"
				redirect_to article_path(@article)
			else 
				render 'new'
			end
		end

		def show
			@article = Article.find(params[:id])
		end

		def edit
			@article = Article.find(params[:id])
			@categories = Category.all
			@category_topics = Category.find(@article.category_id).topics
		end

		def update
			@article = Article.find(params[:id])
			@current_admin_name = current_admin.first_name + " " + current_admin.last_name
			@article.update(article_params)
			@article.update_attributes(author: @current_admin_name)
			if @article.save
				flash[:success] = "'#{@article.title}' has been updated."
				redirect_to article_path(@article)
			else
				render 'edit'
			end
		end

		def change
			@articles = Article.all
		end

		def destroy
			@article = Article.find(params[:id])
			flash[:warning] = "Article titled '#{@article.title}' deleted."
			@article.destroy
			redirect_to root_url
		end
end
