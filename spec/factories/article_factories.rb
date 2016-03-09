FactoryGirl.define do 
  factory :article do
    association :author, factory: :admin
    title "An Example Article"
    content "Example Content"
    topic_id 1
  end

end
