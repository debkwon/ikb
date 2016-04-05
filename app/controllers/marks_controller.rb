class MarksController < ApplicationController
  include MarksHelper

  def create
    @mark = Mark.new(mark_params)
    if @mark.save
      flash[:success] = "Great progress!"
      redirect_to my_projects_path
    else 
      render 'new'
    end
  end

end
