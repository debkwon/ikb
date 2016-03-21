module ChartsHelper
  def chart_params
    params.require(:chart).permit(:title, :description, :goal_date, :creator_id)
  end
end
