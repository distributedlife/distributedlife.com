###
# Blog settings
###

# Time.zone = "Melbourne"

activate :blog do |blog|
  blog.prefix = "resources"
  blog.permalink = ":title.html"
  # blog.sources = ":year-:month-:day-:title.html"
  # blog.taglink = "tags/:tag.html"
  blog.layout = "article"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  # blog.default_extension = ".markdown"

  # blog.tag_template = "tag.html"
  # blog.calendar_template = "calendar.html"

  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/:num"
end

page "/feed.xml", :layout => false

###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

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



# news - bits of news that are not articles: I did this
# articles - discrete articles
# tips - how to do things that are not articles.
# travel - from the travel blog
# fountainhead - from that chunk
tips = []
articles = []
travel = []
fountainhead = []

@all_articles = data.news.concat(data.elsewhere).concat(articles).concat(tips).concat(travel).concat(fountainhead)
@all_articles.sort! {|a, b| b[:date] <=> a[:date]}

page "/index.html", :layout => "/layouts/index.html.haml" do
  @recently = @all_articles[0..2]
  @projects = data.projects
end

proxy "/news", "items.html", :locals => {:news => @all_articles, :layout => "source/layouts/items.html.haml"}
###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers do
  def site_url
    "http://distributedlife.com"
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
  # activate :syntax

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

configure :development do
  activate :livereload
end
