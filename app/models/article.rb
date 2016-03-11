class Article < ActiveRecord::Base
	include Bootsy::Container
	belongs_to :topic
	belongs_to :category
	validates  :title, presence: true
	validates  :topic_id, presence: true, numericality: { greater_than: 0, :message => "must be selected"}
	validates_presence_of	 :category_id, :message => "must be selected"
	# validate :legit_video

	# attr_accessor :exclude_drafts

	searchable do
		text    :title
		text    :content
		integer :category_id 
		boolean :is_draft
	end
	
end