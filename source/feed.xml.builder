xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  site_url = "http://www.distributedlife.com/"
  xml.title "distributedlife"
  xml.subtitle "Word and music by Ryan Boucher"
  xml.id "http://www.distributedlife.com"
  xml.link "href" => "http://www.distributedlife.com"
  xml.link "href" => URI.join(site_url, current_page.path), "rel" => "self"
  # xml.updated blog.articles.first.date.to_time.iso8601
  xml.author { xml.name "Ryan Boucher" }

  @all_articles.each do |article|
    xml.entry do
      xml.title article['title'].join(" ")

      if article.has_key? 'url'
        xml.link "rel" => "alternate", "href" => article['url']
        xml.id URI.join(site_url, article['url'])
      else
        xml.link "rel" => "alternate", "href" => "http://www.distributedlfe.com"
        xml.id URI.join(site_url, article['id'])
      end

      xml.published article['date'].to_time.iso8601
      xml.updated article['date'].to_time.iso8601
      # xml.updated File.mtime(article.source_file).iso8601
      xml.author { xml.name "Ryan Boucher" }
      xml.summary article['brief'], "type" => "text"
      # xml.content article['brief'], "type" => "text"
    end
  end
end
