module ArticlesHelper

	def article_params
		params.require(:article).permit(:title, :content,  :bootsy_image_gallery_id)
	end

end
