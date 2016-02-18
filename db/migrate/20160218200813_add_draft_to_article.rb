class AddDraftToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :is_draft, :boolean
  end

  def self.down
    remove_column :articles, :is_draft, :boolean
  end
end
