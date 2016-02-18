module TopicsHelper
	def topic_params
		params.require(:topic).permit(:name, :category_id)
	end
end
