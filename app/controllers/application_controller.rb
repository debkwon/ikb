class ApplicationController < ActionController::Base
	before_action :authenticate_admin!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :check_for_search

  def check_for_search
    params[:search].present? || params[:category_ids].present? 
      @search = Article.search do
        fulltext params[:search] 
        with(:category_id, params[:category_ids]) if params[:category_ids].present? 
        with(:is_draft, 1) if params[:draft_status] === '2' 
        without(:is_draft, 1) if params[:draft_status] === '1'
        if params[:meeting_minutes] != '1'
          without(:topic_id, 27) #this should be the topic id for meeting minutes once the categories are back
        end
      end
      @found_articles = @search.results
    end
  
end
