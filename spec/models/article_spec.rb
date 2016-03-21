require 'rails_helper'

RSpec.describe Article, type: :model do
  it "raises error when missing title" do
    article = Article.new(title: nil)
    expect{ article.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "raises error when missing topic" do
    article = Article.new(topic_id: nil)
    expect{ article.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "is valid with all params" do
    article = Article.new(attributes_for(:article))
    expect(article).to be_valid
  end
end
