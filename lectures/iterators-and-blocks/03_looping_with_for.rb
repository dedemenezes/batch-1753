# for loops

students = ['Hermione', 'Ron', 'Draco', 'Neville']
# index        0          1       2         3
# for using indexes

for index in 0..(students.length - 1)
  p index
  p "Hello #{students[index]}!"
end

# for over collection
for name in students
  puts "Hello #{name}!"
end

# Hello Hermione!
# Hello Ron!
# Hello Draco!
