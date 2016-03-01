class Category < ActiveRecord::Base
	has_many :topics
  has_many :articles, :through => :topics
	validates :name, presence: true

  # searchable do
  #   text :name,
  #   text :articles 
  # end
end
