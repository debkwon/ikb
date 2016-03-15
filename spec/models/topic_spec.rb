require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic) { create :topic }
  describe "POST #create" do 
    context "with valid params" do
      it "passes validations" do
	     expect(topic).to be_valid
      end
    end
    context "with invalid/missing params" do
      it "will raise an error without name" do
        topic_nameless = Topic.new(name:"")
        topic_nameless.valid?
        expect(topic_nameless.errors[:name]).to include("can't be blank")
      end
      it "will raise error without category" do
        topic_catless = Topic.new(category_id:nil)
        topic_catless.valid?
        expect(topic_catless.errors[:category_id]).to include("can't be blank")
      end
    end
  end
end
