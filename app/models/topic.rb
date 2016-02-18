class Topic < ActiveRecord::Base
	belongs_to :category
	has_many :articles

	validates :name, presence: true
	validates :category_id, presence: true
	
end
