require "open-uri"
require "nokogiri"

# Let's scrape recipes from https://www.bbcgoodfood.com


# 1. Visit the web site (MAke an HTTP request)
# 2. Parse the HTML response
# 3. Search for whatever you want!


html_file = URI.open('https://www.bbcgoodfood.com/search?q=chicken').read
# p html_file

# Parse this HTML into something that we can work easily
html_doc = Nokogiri::HTML.parse(html_file)
# p html_doc

# I NEED TO PASS A CSS SELECTOR
recipes = []
html_doc.search('div.card__section.card__content a h2').each do |element|
  recipes << element.text
end

p recipes
