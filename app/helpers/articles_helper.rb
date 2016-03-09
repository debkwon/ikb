module ArticlesHelper

	def article_params
		params.require(:article).permit(:title, :content, :topic_id, :category_id, :is_draft, :bootsy_image_gallery_id, :video_url)
	end

  def youtube_embed(youtube_url)
    youtube_id = youtube_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end
end
