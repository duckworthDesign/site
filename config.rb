###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###
activate :syntax, :line_numbers => true
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.prefix = "articles"
  blog.name = "articles"

  blog.permalink = "{month}/{year}/{title}.html"
  # Matcher for blog source files
  blog.sources = "{month}-{year}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  blog.layout = "article"
  # blog.summary_separator = /(READMORE)/
  blog.summary_length = 50
  blog.year_link = "{year}.html"
  blog.month_link = "{month}/{year}.html"
  blog.day_link = "{day}/{month}/{year}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false
# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end
helpers do

  def title_as_class the_title
    the_title.downcase.gsub(" ", "_")
  end

end

# Build-specific configuration
configure :build do
  # Minify Javascript and CSS on build
  activate :minify_css
  activate :minify_javascript
  set :build_dir, 'docs'
  activate :relative_assets
end
