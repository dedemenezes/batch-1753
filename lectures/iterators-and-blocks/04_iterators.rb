# Ruby has a lot of built'in methods
# that will help us to go over a collection

students = ['hermione', 'Ron', 'Draco', 'Neville', 'Luna', 'Harry']
# index        0          1       2         3

# EACH
# Just go over some collection and performs your actions
students.each do |name|
  # Do your thing with each one of the elements
  # access each element using the variable
  # inside the pipes. This variable can have
  # any name! Give it a meaningful one.
  puts name
  # puts name.upcase
  # first = name.chars.first.downcase
  # rest = name.chars[1..].join.upcase
  # p first + rest
end

# EACH WITH INDEX
# iterates and gives access to each element and it's index
students.each_with_index do |name, index|
  # now we have not only access to each element
  # using the 'name' variable but also to the
  # position in the students array. More known as INDEX
  puts "Student #{name.upcase} is at position/index: #{index}" if index.even?

  # We can now do stuff using like
  puts "Student #{name.downcase.chars.shuffle.join.capitalize} is at position/index: #{index}" if index.odd?
end

# MAP - Super helpful!
# returns an new array, mapping each element to the last line of the block

# let's say that I have an array or a collection of students and I want to create a new array
# Inside this new array I want to have all students name upcased!
# we could create a new array
upcased_names = []

# iterate over the students we have
students.each do |name|
  # for each student
  # we can upcase their name
  upcased_name = name.upcase
  # and ppush each name to our new array
  upcased_names << upcased_name
end

p upcased_names

# 1. Map will iterate over the array just like the each BUT
# Map will return an new array, and
# the last line of the block will be used to update each element (the return of the block)

new_array = students.map do |name|
  # 1. upcase the name
  upcased_name = name.upcase
  upcased_name
end

p new_array

# Let's define an array with some musicians names
musicians = ['Jimi Hendrix', 'Snoop Dogg', 'Michael Jackson']

# Now we want to generate a new array containing the musicians first names
# using MAP! =)
first_names = musicians.map do |full_name|
  names = full_name.split(' ')
  names.first
end

p first_names

# COUNT
# takes a condition inside the block
# and returns the number(integer) of elements
# that are true for the given condition

h_names_counter = students.count do |name|
  # must have a condition inside
  # something that return true or false
  name.start_with?('H')
end
p h_names_counter


# Select
# takes a condition inside the block
# and returns a NEW ARRAY containing the elements
# that are true for the given condition
r_named_students = students.select do |name|
  name.start_with?('R')
end

p r_named_students



# EXAMPLE FROM DOCUMENTATION!
# DROP_WHILE
# Calls the block with successive elements
# as long as the block returns a truthy value;
# returns an array of all elements after that point:
after_h_students = students.sort.drop_while do |name|
  # first letter is before I
  name[0] < 'I'
end

p after_h_students
