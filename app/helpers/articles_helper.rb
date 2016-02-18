module ArticlesHelper

	def article_params
		params.require(:article).permit(:title, :content, :topic_id, :bootsy_image_gallery_id)
	end

end
