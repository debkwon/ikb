class Article < ActiveRecord::Base
	include Bootsy::Container
	belongs_to :topic
	validates :title, presence: true
	validates :topic_id, presence: true
	validates	:category_id, presence: true

	def self.search(search)
		search_list = []
		sanitized_search = sanitize_sql_array(["to_tsquery('english', ?)", search.gsub(/\s/,"+")])
		search_list |= where("textsearchable_index_col @@ #{sanitized_search}").order("ts_rank_cd(textsearchable_index_col, #{sanitized_search})desc limit 15")
		search_list
	end
	
end