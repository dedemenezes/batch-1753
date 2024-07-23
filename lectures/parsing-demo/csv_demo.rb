# frozen_string_literal: true

require 'csv' # load the CSV class into my file!

# TODO: - let's read/write data from beatles.csv

# PARSING
# filepath = 'data/beatles.csv'

# CSV.foreach('data/beatles.csv', headers: :first_row) do |row|
#   p row
#   # p "first name is: #{row[0]} | last name is: #{row[1]} | instrument is: #{row[2]}"
#   # p "first name is: #{row['First Name']} | last name is: #{row['Last Name']} | instrument is: #{row['Instrument']}"
#   # first name is: John
# end

# STORING

beatles = [
  ['John', 'Lennon', 'Guitar'],
  ['Paul', 'McCartney', 'Bass Guitar'],
  ['George', 'Harrison', 'Lead Guitar'],
  ['Ringo', 'Starr', 'Drums']
]

CSV.open('data/beatles.csv', 'wb') do |csv|
  # how can I add data to a CSV file
  # I CAN ONLY STORE AN ARRAY
  csv << ['First Name', 'Last Name', 'Instrument']
  # csv << ["John", "Lennon", 'Guitar']
  beatles.each do |beatle|
    # e.g. beatle is ['John', 'Lennon', 'Guitar']
    csv << beatle
  end
end
