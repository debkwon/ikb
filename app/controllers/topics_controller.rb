class TopicsController < ApplicationController
	include TopicsHelper
	
	def new
		@topic = Topic.new
		@categories = Category.all
	end

	def create
		@topic = Topic.new(topic_params)
		if @topic.save
			flash[:success] = "You added the '#{@topic.name}' to the Category '#{@topic.category.name}'."
			redirect_to root_url
		else
			render 'new'
		end
	end

	def edit
		@topic = Topic.find(params[:id])
	end

	def update
		@topic = Topic.find(params[:id])
		@topic.update(topic_params)
		if @topic.save
			flash[:success] = "Topic named '#{@topic.name}' updated."
			redirect_to edit_topics_path
		else 
			render 'edit'
		end
	end

	def change
		@topics = Topic.all
	end
end
