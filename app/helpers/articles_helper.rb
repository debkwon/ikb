module ArticlesHelper

	def article_params
		params.require(:article).permit(:title, :content, :topic_id, :category_id, :is_draft, :bootsy_image_gallery_id, :video_url)
	end

  def legit_video
    if video_url.present? && incorrect_format?
      errors.add(:video_url, "is in an invalid format")
    end
  end

  def incorrect_format?
    if video_url.match(/^(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})/
)
      return false
    else 
      return true
    end
  end

  def youtube_embed(youtube_url)
    youtube_id = youtube_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end
end
