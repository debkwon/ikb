class ApplicationController < ActionController::Base
	before_action :authenticate_admin!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :check_for_search

  def check_for_search
    if params[:search].present? 
      @search = Article.search do 
        fulltext params[:search]
      end
    @found_articles = @search.results
    end
  end

end
