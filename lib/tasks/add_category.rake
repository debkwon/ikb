desc 'update article instances with missing category id'
  namespace :articles do
    task :update_category_id => :environment do
      @articles = Article.all
      @articles.each do |article|
        if article.category_id.nil?
          article.category_id = article.topic.category_id
          article.save!
          puts "Added #{article.category_id} to #{article.title}"
        end
      end
    end
  end