class Article < ActiveRecord::Base
	include Bootsy::Container
	belongs_to :topic
	belongs_to :category
	validates  :title, presence: true
	validates  :topic_id, presence: true
	validates	 :category_id, presence: true

	attr_accessor :exclude_drafts

	searchable do
		text    :title
		text    :content
		integer :category_id 
		boolean :is_draft
	end
	
end