require_relative '../scraper'


# RSpec.describe '#fetch_movies_url' do
#   it 'returns an array of movies url\'s' do
#     expected = [
#       "https://www.imdb.com/title/tt0111161/",
#       "https://www.imdb.com/title/tt0068646/",
#       "https://www.imdb.com/title/tt0468569/",
#       "https://www.imdb.com/title/tt0071562/",
#       "https://www.imdb.com/title/tt0050083/"
#     ]
#     actual = fetch_movies_url
#     expect(actual).to eq(expected)
#   end
# end

RSpec.describe '#scrape_movie' do
  it 'returns a hash with the movie information' do
    expected = {
      cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
      director: "Christopher Nolan",
      summary: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: 2008
    }
    actual = scrape_movie('https://www.imdb.com/title/tt0468569/')
    expect(actual).to eq(expected)
  end
end
