class AddReferenceToArticles < ActiveRecord::Migration
  def change
  	add_reference :articles, :topic, index: true
  	add_foreign_key :articles, :topics
  end
end
