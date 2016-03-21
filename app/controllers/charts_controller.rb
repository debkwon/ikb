class ChartsController < ApplicationController
  include ChartsHelper
  def index
    @charts = Chart.all
  end

  def my_projects
    @charts = Chart.where(creator_id: current_admin.id)
  end

  def new
    @chart = Chart.new
  end

  def create
    @chart = Chart.new(chart_params)
    @chart.creator_id = current_admin.id
    if @chart.save
      flash[:success] = "You're off to a great start!"
      redirect_to my_projects_path
    else
      render 'new'
    end
  end


end
