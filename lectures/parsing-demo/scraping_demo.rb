# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'

# Let's scrape recipes from https://www.bbcgoodfood.com

# Always the same steps!
# 1. Visit the web site (MAke an HTTP request)
html_file = URI.open('https://www.bbcgoodfood.com/search?q=chicken').read

# 2. Parse the HTML response into something that we can work easily
html_doc = Nokogiri::HTML.parse(html_file)

# 3. Search for whatever you want!
# I NEED TO PASS A CSS SELECTOR
html_doc.search('div.card__section.card__content a h2').each(&:text)
