require 'rails_helper'

RSpec.describe Article, type: :model do
   it "raises error when there's no title" do
	    article = Article.new(title: nil)
	    expect{ article.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end

	  it "raises error when there's no associated topic" do
	    article = Article.new(topic_id: nil)
	    expect{ article.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
