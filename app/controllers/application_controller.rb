class ApplicationController < ActionController::Base
	before_action :authenticate_admin!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :check_for_search

  def check_for_search
    search = Article.search do
      fulltext params[:search]
      with(:category_id, params[:category_ids]) if params[:category_ids].present?  
      with(:is_draft, 0) if params[:exclude_drafts].present?
    end
    @found_articles = search.results
  end

end
