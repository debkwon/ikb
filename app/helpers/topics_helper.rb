module TopicsHelper
	def topic_params
		params.require(:topic).permit(:name)
	end
end
