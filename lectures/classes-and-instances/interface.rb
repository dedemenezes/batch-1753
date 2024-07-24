require_relative 'car'
# We want to create new INSTANCES of the Car class!
first_car = Car.new('red')
p first_car
#<Car:0x00007fd534492490 @engine_started=false, @color="red", @number_of_kilometers=0, @number_of_doors=4>
p first_car.color
p first_car.number_of_kilometers
first_car.number_of_kilometers = 10000

first_car.color = 'blue'
p first_car

first_car.start_engine
p first_car

p first_car.engine_started?

second_car = Car.new('green')
p second_car.color
## ternary if
## condition ? code_if_true : code_if_false
puts "Engine is running? #{first_car.engine_started? ? 'RUNNING!' : 'not running!' }"


# ENCAPSULATION!
puts 'What is the trunk size?'
# This line below will throw an ERROR! Read the error and fixe it as an exercise ;)
puts first_car.trunk_size
