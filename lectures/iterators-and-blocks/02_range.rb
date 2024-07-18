# range.rb
puts (0..10).class #=> Range

puts 0..10 #=> All elements from 0 to 10 (included)
p (0..10).to_a

puts 0...10 #=> All elements from 0 to 10 (not included)
p (0...10).to_a
