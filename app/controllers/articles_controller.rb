class ArticlesController < ApplicationController
	include ArticlesHelper
	include TopicsHelper
	include CategoriesHelper

		def index
		end

		def directory
		end

		def new
			@article = Article.new
			@topics = Topic.all
			@categories = Category.all
		end

		def create
			@article = Article.new(article_params)
			@current_admin_name = current_admin.first_name + " " + current_admin.last_name
			@article.topic_id = params[:article][:topic]
			@article.author = @current_admin_name
			if @article.save
				flash[:success] = "Your article has been saved!"
				redirect_to article_path(@article)
			end
		end

		def show
			@article = Article.find(params[:id])
		end

		def edit
			@article = Article.find(params[:id])
		end

		def update
			@article = Article.find(params[:id])
			@current_admin_name = current_admin.first_name + " " + current_admin.last_name
			@article.update(article_params)
			@article.update_attributes(author: @current_admin_name)
			flash[:success] = "#{@article.title} has been updated."
			redirect_to article_path(@article)
		end
end
