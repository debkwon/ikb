module MarksHelper
  def mark_params
    params.require(:mark).permit(:description, :date, :chart_id)
  end
end
