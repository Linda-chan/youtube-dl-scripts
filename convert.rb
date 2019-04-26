#/bin/ruby -w

# https://www.sitepoint.com/markdown-processing-ruby/
# https://github.com/github/markup
#
# For Ruby 2.0.0: 
# gem install kramdown -v 1.16.0
# gem install github-markup

require "github/markup"
#require "kramdown"

MD_FILE_NAME = "README.md"
TPL_FILE_NAME = "index.tpl"

md_text = File.read(MD_FILE_NAME)
template_text = File.read(TPL_FILE_NAME)

html_text = GitHub::Markup.render(MD_FILE_NAME, md_text)
#html_text = Kramdown::Document.new(md_text).to_html

# Не знаю, что за фигня...
html_text = html_text.gsub("<p><code>\n", "<pre><code>")
html_text = html_text.gsub("</code></p>", "</code></pre>")

html_text = template_text.gsub("%TEXT%", html_text)

File.write("index.html", html_text)
