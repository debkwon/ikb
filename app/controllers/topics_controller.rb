class TopicsController < ApplicationController
	include TopicsHelper

	def index
		@topics = Topic.all
	end

	def new
		@topic = Topic.new
		@categories = Category.all
	end

	def create
		@topic = Topic.new(topic_params)
		@topic.category_id = params[:category_id][:id]
		if @topic.save
			flash[:success] = "You added the '#{@topic.name}' to the Category '#{@topic.category.name}'."
		end
		redirect_to root_url
	end

	def edit
		@topic = Topic.find(params[:id])
	end

	def update
		@topic = Topic.find(params[:id])
		@topic.update(topic_params)
		if @topic.save
			flash[:success] = "Topic named '#{@topic.name}' updated."
		end
		redirect_to edit_topics_path
	end

	def change
		@topics = Topic.all
	end
end
