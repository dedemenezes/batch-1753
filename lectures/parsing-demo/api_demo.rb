require "json"
require "open-uri"
# is a library that alloow us to make HTTP request

# TODO - Let's fetch name and bio from a given GitHub username
# url = "https://api.github.com/users/ssaunier"


# Make the HTTP request
serialized_response = URI.open("https://api.github.com/users/dedemenezes").read
# p serialized_response

# Parse this JSON to our lovely Hash
parsed_response = JSON.parse(serialized_response)
p parsed_response['avatar_url']
