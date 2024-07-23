require 'open-uri'
require 'nokogiri'

def fetch_movies_url
  # 1. Make an HTTP request!
  url = 'https://www.imdb.com/chart/top/'
  html_file = URI.open(url, "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36").read
  # 2. Parsing the HTML
  html_doc = Nokogiri::HTML.parse(html_file)
  # 3. Search for whatever you want!

  # new_array = []
  html_doc.search('.ipc-title-link-wrapper').first(5).map do |element|
    movie_path = element.attribute('href').value
    # remove everything after the question mark
    movie_url = "https://www.imdb.com#{movie_path}"
    match_data = movie_url.match(/(.+)\?/) # can access groups by index || names
    # new_array << match_data[1]
    match_data[1]

  end
  # p new_array
end


def scrape_movie(url)
  movie_hash = {}
  # 1. Make an HTTP request!
  html_file = URI.open(url, "Accept-Language" => "en-US", "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36").read
  # 2. Parsing the HTML
  html_doc = Nokogiri::HTML.parse(html_file)
  # 3. Search for whatever you want!
  html_doc.search('.ipc-metadata-list__item:contains("Director") a').first(1).each do |element|
    # add a new key/value pair to the movie_hash
    movie_hash[:director] = element.text
  end

  cast = html_doc.search('.ipc-metadata-list__item:contains("Stars") li').map do |element|
    # add a new key/value pair to the movie_hash
    element.text
  end
  movie_hash[:cast] = cast.uniq

  html_doc.search('.sc-2d37a7c7-0.caYjFF').each do |element|
    movie_hash[:summary] = element.text
  end

  css_selector = '.ipc-inline-list.ipc-inline-list--show-dividers.sc-d8941411-2.cdJsTz.baseAlt li:first-child'
  html_doc.search(css_selector).each do |element|
    movie_hash[:year] = element.text.to_i
  end

  html_doc.search('h1').each do |element|
    movie_hash[:title] = element.text
  end
  p movie_hash
end
