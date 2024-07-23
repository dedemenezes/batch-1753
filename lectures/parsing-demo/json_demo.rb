require "json"

# TODO - let's read/write data from beatles.json
filepath = "data/beatles.json"


# PARSING!

serialized_file = File.read(filepath)
# puts serialized_file
# p serialized_file

# convert it to our hash -> PARSE THIS JSON INTO A HASH
parsed_json = JSON.parse(serialized_file)
p parsed_json['beatles'][2]['instrument']

all_beatles = parsed_json['beatles']
second_beatle = all_beatles[1]
p second_beatle
first_name = second_beatle['first_name']
p first_name


# STORING
beatles = { beatles: [
  {
    first_name: "John",
    last_name: "Lennon",
    instrument: "Guitar"
  },
  {
    first_name: "Paul",
    last_name: "McCartney",
    instrument: "Bass Guitar"
  },
  # etc...
]}

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(beatles))
end
