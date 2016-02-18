class Article < ActiveRecord::Base
	include Bootsy::Container
	belongs_to :topic

	def self.search(search)
		search = search.downcase
		where("title LIKE ?", "%#{search}%") || where("content LIKE ?", "%#{search}%")
	end
end