class Article < ActiveRecord::Base
	include Bootsy::Container
	belongs_to :topic
	validates :title, presence: true
	validates :topic_id, presence: true

	def self.search(search) #this search is checking for each word being present, but not for frequency
		search = search.downcase.split
		i = 0
		search_list = []
			while i < search.length
				search_list |= where("title LIKE ?", "%#{search[i]}%") #pushing only results into array
				search_list |= where("content LIKE ?", "%#{search[i]}%")
				i+=1
			end
		search_list #just to return this to articles controller
	end
	
end