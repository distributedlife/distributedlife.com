###
# Blog settings
###

# Time.zone = "Melbourne"

activate :blog do |blog|
  blog.prefix = "resources"
  blog.permalink = ":title.html"
  # blog.sources = ":year-:month-:day-:title.html"
  # blog.taglink = "tags/:tag.html"
  blog.layout = "layout"
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



# TODO: aggregate the fountainhead, tips, articles, news, travel, etc
# news - bits of news that are not articles: I did this
# articles - discrete articles
# tips - how to do things that are not articles.
# travel - from the travel blog
# fountainhead - from that chunk
news = [
  {
    title: "New blog layout",
    brief: "I've redesigned this place to look better on mobile, tablet or desktop. I have also restructured it to make it easier to find out what I'm working on or to find the articles worth reading.",
    where: "news",
    date: "2015/03/01"
  },
  {
    title: "Traceroute gem now fails the build",
    brief: "I've made a fork of the traceroute gem. The change will optionally fail the build when it detects unused routes and inaccessible actions.",
    where: "Github",
    date: "2015/02/18",
    url: "https://github.com/distributedlife/traceroute",
    action: "Take a look"
  }
]
tips = []
articles = []
travel = []
fountainhead = []
elsewhere = [
  {
    title: "Four ways to split a story",
    brief: "Approaches to reducing story complexity for iterative development.",
    where: "P2 Magazine",
    date: "2013/11/01",
    url: "http://thoughtworks.github.io/p2/issue06/four-ways-to-split-a-story/"
  },
  {
    title: "BDD and Legacy Systems",
    brief: "Behaviour driven development, by itself, doesn’t work on legacy systems. A key ingredient is still missing and I’m going to talk about what that is.",
    where: "P2 Magazine",
    date: "2013/10/01",
    url: "http://thoughtworks.github.io/p2/issue05/bdd-on-legacy/"
  },
  {
    title: "Pattern Fun Facts: Decorator",
    brief: "In pattern fun facts we take a look a pattern and tell you something you didn’t know. This month: The decorator pattern can help you do incremental delivery.",
    where: "P2 Magazine",
    date: "2013/10/01",
    url: "http://thoughtworks.github.io/p2/issue05/pattern-fun-fact-decorator/"
  },
  {
    title: "I can tell you, but then you'd understand",
    brief: "On anonymous functions, code readability and design erosion.",
    where: "P2 Magazine",
    date: "2013/10/01",
    url: "http://thoughtworks.github.io/p2/issue05/anonymous-functions/"
  }
]

# news.map! {|item| item[:type] = "News"; item }
@all_articles = news.concat(elsewhere).concat(articles).concat(tips).concat(travel).concat(fountainhead)

page "/index.html", :layout => "/layouts/index.html.haml" do
  @recently = @all_articles.sort {|a, b| b[:date] <=> a[:date]}[0..2]
  @projects = [
    {
      name: "What You Need to Know About Dates and Times in Computing",
      brief: "Struck with a burning desire to reduce the incidents of date and time related mishaps that occur, I and two friends set out to distill the essence of calendars, timezones and daylight saving.",
      image: "/images/book.jpg",
      link: "http://cromulent-publishing.com",
      action: "Get the book"
    },
    {
      name: "Notes From Other Places",
      brief: "Fortunate enough to leave my own country I try to share what I witness and understand using naught but images and words. Notes from other places contains interesting stories, observations and photos from places that are not where I live.",
      image: "https://farm8.staticflickr.com/7001/13517460004_e6a69f2190_n.jpg",
      link: "http://distributedlife.com/travel",
      action: "Go Explore"
    },
    {
      name: "inch.js",
      brief: "A javascript game framework that gives you the inch to go the extra mile.",
      image: "/images/inch.png",
      link: "http://inch.org",
      action: "Come Play"
    },
    {
      name: "Fountainhead",
      brief: "What lies beyond this link are ideas that I've had. Some are more fleshed out than others. If you catch me on the right day I'll join forces with you and make it.",
      image: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ9EtFXW7NT1ANuKep7ZyJSR_9xXKJt9b-wGdS_iSmX92ALVorH",
      link: "/fountainhead.html",
      action: "Start something"
    },
    {
      name: "Lists",
      brief: "I like lists, perchance a little too much. If you like lists then you'll appreciate this.",
      image: "http://www.off-the-path.com/wp-content/uploads/2011/11/interhigh_bucketlist.jpg",
      link: "/lists.html",
      action: "Enumerate"
    },
    {
      name: "P2 Magazine",
      brief: "In 2013 I started and was the chief editor of the ThoughtWorks magazine that focuses on software excellence. It was an amazing journey that started with a conversation in a coffeeshop and ended with me handing the reins over to Rachel Laycock.",
      image: "/images/p2-magazine.png",
      link: "http://thoughtworks.github.io/p2/",
      action: "Be Excellent"
    },
    {
      name: "The Interview",
      brief: "In 2012 and 2013 I created and ran an ThoughtWorks-only interview series called The Interview but also called An Interview with a ThoughtWorker. It aimed to reduce the distance between geographically dispersed colleagues whilst allowing me to challenge how an interview is structured.",
      image: "/images/the-interview.png",
      link: "/projects/the-interview.html",
      action: "Enquire"
    }
  ]
end

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
    activate :syntax

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
