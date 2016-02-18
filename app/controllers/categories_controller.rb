class CategoriesController < ApplicationController
	include CategoriesHelper

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "You created a Category called #{@category.name}"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		@category.update(category_params)
		if @category.save
			flash[:success] = "Category named '#{@category.name}' has been updated."
			redirect_to edit_categories_path
		else 
			render 'edit'
		end
		
	end

	def change
		@categories = Category.all
	end

	def destroy
	end
end
