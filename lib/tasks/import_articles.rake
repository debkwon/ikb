require 'nokogiri'

desc "import all current IKB articles"
  namespace :articles do
    task :import_xml => :environment do

      doc = File.open("lib/assets/kb-articles.xml") { |f| Nokogiri::XML(f) }
      all_titles = []
      all_content = []
      all_authors = []
      all_created_at = []
      all_updated_at = []

      doc.xpath("//row//field[@name='title']").each do |item|
        all_titles << item.text  
      end
      doc.xpath("//row//field[@name='content']").each do |item|
        all_content << item.text  
      end
      doc.xpath("//row//field[@name='author_user_id']").each do |item|
        all_authors << item.text  
      end
      doc.xpath("//row//field[@name='created_at']").each do |item|
        all_created_at << item.text  
      end
      doc.xpath("//row//field[@name='updated_at']").each do |item|
        all_updated_at << item.text  
      end

      i = 0
      while i < all_titles.length
         new_article = Article.create!(
          title: all_titles[i],
          content: all_content[i],
          author: all_authors[i],
          created_at: all_created_at[i],
          updated_at: all_updated_at[i],
          topic_id: 27,
          category_id: 10
          )
        if new_article.save
          puts "#{new_article.title} has been added!"
          i += 1
        end
      end

    end
  end