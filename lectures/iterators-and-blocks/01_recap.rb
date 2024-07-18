# Recap

# STRING
'Hermione'.class
name = 'Hermione'
"#{name} is the best student"

# Float
12.2

# Integer
12

# Boolean #=> TrueClass || FalseClass
true || false

# Array
['hermione', 12, 12.3, true]

# CRUD Array
# CREATE
students = ['Hermione', 'Harry']
students << 'Harry'
students.push('Draco')
# p students

# READ -> by the index!
p students[0]

# UPDATE
students[0] = 'Neville'
p students

# DELETE
# students.delete('Harry') #=> deletes every single appearance of 'Harry'
students.delete_at(1)      #=> deletes the specific element AT INDEX
p students
