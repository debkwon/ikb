FactoryGirl.define do 
  factory :article do
    title "An Example Article"
    content "Example Content"
    topic_id 1
    category_id 1
  end
end

FactoryGirl.define do
  factory :missing_title, class: Article do
  content "Example Content"
  topic_id 1
  category_id 1
  end
end

FactoryGirl.define do
  factory :missing_category, class: Article do
  title "An Example Title"
  content "Example Content"
  topic_id 1
  end
end

FactoryGirl.define do
  factory :missing_topic, class: Article do
  title "An Example Title"
  content "Example Content"
  category_id 1
  end
end

FactoryGirl.define do
  factory :missing_everything, class: Article do
    title ""
  end
end


