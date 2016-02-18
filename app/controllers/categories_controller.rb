class CategoriesController < ApplicationController
	include CategoriesHelper

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "You created a Category called #{@category.name}"
		end
		redirect_to root_url
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		@category.update(category_params)
		if @category.save
			flash[:success] = "Category name updated."
		end
	end

	def change
		@categories = Catgory.all
	end

	def destroy
	end
end
