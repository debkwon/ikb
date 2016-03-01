class Article < ActiveRecord::Base
	include Bootsy::Container
	belongs_to :topic
	belongs_to :category
	validates :title, presence: true
	validates :topic_id, presence: true
	validates	:category_id, presence: true

	searchable do
		text :title
		text :content
	end
	
end