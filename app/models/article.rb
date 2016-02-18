class Article < ActiveRecord::Base
	include Bootsy::Container
	belongs_to :topic
	validates :title, presence: true
	validates :topic_id, presence: true

	def self.search(search)
		search = search.downcase
		where("title LIKE ?", "%#{search}%") || where("content LIKE ?", "%#{search}%")
	end
	
end