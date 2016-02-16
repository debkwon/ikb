class Article < ActiveRecord::Base
	include Bootsy::Container
	belongs_to :topic
end
