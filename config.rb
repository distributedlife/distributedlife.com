###
# Blog settings
###

Time.zone = "Melbourne"

# activate :blog do |blog|
#   blog.prefix = "article/"
#   blog.permalink = "{title}.html"
#   # blog.sources = ":year-:month-:day-:title.html"
#   # blog.taglink = "tags/:tag.html"
#   blog.layout = "article.haml"
#   # blog.summary_separator = /(READMORE)/
#   # blog.summary_length = 250
#   # blog.year_link = ":year.html"
#   # blog.month_link = ":year/:month.html"
#   # blog.day_link = ":year/:month/:day.html"
#   # blog.default_extension = ".md"

#   # blog.tag_template = "tag.html"
#   # blog.calendar_template = "calendar.html"

#   # blog.paginate = true
#   # blog.per_page = 10
#   # blog.page_link = "page/:num"
# end

page "/feed.xml", :layout => false

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end



# news - bits of news that are not articles and link elsewhere
# articles - discrete articles that are hosted on this site
# elsewhere - articles that are hosted elsewhere
# TIL - how to do things that are not articles.
# travel - from the travel blog
# fountainhead - from that chunk
def past_and_present items
  items.select {|i| Time.zone.parse(i['date']) < Time.zone.today}
end

news = data.news
articles = data.articles
elsewhere = data.elsewhere
til = data.til
projects = data.projects
travel = []
fountainhead = []

def create_key article
  article['title'].join('-').gsub(' ', '-').downcase
end

@all_articles = news.concat(elsewhere).concat(articles).concat(til).concat(travel).concat(fountainhead)
@all_articles = past_and_present(@all_articles)
@all_articles.map! { |article| article['id'] = create_key(article); article}
@all_articles.sort! {|a, b| b[:date] <=> a[:date]}

page "/index.html", :layout => "/layouts/index.html.haml" do
  @recently = @all_articles[0..2]
  @projects = data.projects
end

proxy "/news.html", "items.html", :locals => {:news => @all_articles, :title => "News", :layout => "source/layouts/items.html.haml"}
proxy "/articles.html", "items.html", :locals => {:news => data.articles, :title => "Articles", :layout => "source/layouts/items.html.haml"}

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

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers do
  def site_url
    "http://distributedlife.com"
  end
end

# set :markdown_engine, :kramdown
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  activate :minify_html

  # Minify Javascript on build
  activate :minify_javascript
  activate :syntax
  activate :gzip

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  require "middleman-smusher"
  activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
  # activate :syntax, :line_numbers => true
  activate :rouge_syntax, :line_numbers => true
end

configure :development do
  activate :livereload
end
