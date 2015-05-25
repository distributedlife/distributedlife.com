Time.zone = "Melbourne"

page "/feed.xml", :layout => false

# news - bits of news that are not articles and link elsewhere
# articles - discrete articles that are hosted on this site
# elsewhere - articles that are hosted elsewhere
# TIL - how to do things that are not articles.
# travel - notes from other places
# fountainhead - from that chunk
# food - food from other places
def past_and_present items
  items.select {|i| Time.zone.parse(i['date']) < Time.zone.today}
end

def create_key article
  article['title'].join('-').gsub(' ', '-').downcase
end

def safe_name title
  title.join("-").downcase.gsub(' ', '-')
end

def fleshout_dish dish
  dish['id'] = create_key(dish)
  dish['url'] = "/food/#{dish.id}.html"
  dish['action'] = "Omm Nom Nom"

  dish
end

news = data.news
articles = data.articles
elsewhere = data.elsewhere
til = data.til
projects = data.projects
food = past_and_present(data.food).map { |dish| fleshout_dish(dish) }
travel = []
fountainhead = []

@all_articles = news.concat(elsewhere).concat(articles).concat(til).concat(travel).concat(fountainhead).concat(food)
@all_articles = past_and_present(@all_articles)
@all_articles.map! { |article| article['id'] = create_key(article); article}
@all_articles.sort! {|a, b| b[:date] <=> a[:date]}

page "/index.html", :layout => "/layouts/index.html.haml" do
  @recently = @all_articles[0..2]
  @projects = data.projects
end

proxy "/news.html", "items.html", :locals => {:news => @all_articles, :title => "News", :layout => "source/layouts/items.html.haml"}
proxy "/articles.html", "items.html", :locals => {:news => data.articles, :title => "Articles", :layout => "source/layouts/items.html.haml"}

proxy "/food.html", "food-from-other-places.html", :locals => { :layout => "source/layouts/food-from-other-places.haml", :title => ["Food from", "Other Places"], :items => food }

articles.each do |article|
  content = File.read("data/articles/#{article.content}") unless article.content.nil?

  proxy article.url, "article.html", :locals => {:data => article, :content => content, :layout => "source/layouts/article.html.haml"}
end

projects.each do |project|
  next unless project.has_key? 'content'

  content = File.read("data/projects/#{project.content}") unless project.content.nil?

  proxy project.url, "article.html", :locals => {:data => project, :content => content, :layout => "source/layouts/article.html.haml"}
end

til.each do |til|
  next unless til.has_key? 'content'

  content = File.read("data/til/#{til.content}") unless til.content.nil?

  proxy til.url, "article.html", :locals => {:data => til, :content => content, :layout => "source/layouts/article.html.haml"}
end

food.each do |dish|
  begin
    content = File.read("data/food/#{dish.id}.md")

    proxy dish.url, "food-article.html", :locals => {:data => dish, :content => content, :layout => "source/layouts/food.html.haml"}
  rescue => e
    puts e
    next
  end
end

proxy "/styleguide", "article.html", :locals => {
  :content => File.read("data/styleguide.md"),
  :layout => "source/layouts/article.html.haml",
  :data => {
    "title" => ["Styleguide"]
  }
}

activate :automatic_image_sizes

helpers do
  def site_url
    "http://distributedlife.com"
  end
end

set :haml, { ugly: true }
set :markdown_engine, :kramdown
activate :syntax, :line_numbers => true

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_html

  activate :minify_javascript
  activate :syntax
  activate :gzip

  # activate :cache_buster
  # activate :relative_assets
  require "middleman-smusher"
  activate :smusher

  # set :http_path, "/Content/images/"
end

configure :development do
  activate :livereload
end