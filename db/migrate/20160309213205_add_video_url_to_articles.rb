class AddVideoUrlToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :video_url, :string
  end
  def self.down
    remove_column :articles, :video_url, :string
  end
end
