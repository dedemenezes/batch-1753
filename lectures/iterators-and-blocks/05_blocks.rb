# So we used a lot this
# do |variable|
#   # do your thing
#   variable.upcase
#   variable.start_with?('J')
# end

# This is what we call a BLOCK!

# nothing to be scared about. It is just a method without a name
# think about this

# def do_your_thing(variable)
#   variable.upcase
# end

# do |variable|
#   variable.upcase
# end

# We also change def to do and parenteses to pipe
# but you got what I mean!!!

# So what is the goal with this
# The point is that we can now pass some
# EXTRA BEHAVIORS to some methods!

# This is what allows us to have a mehtod called  #select
# and define WHEN WE CALL THE METHOD how we wnat to select
# clever hum? ruby <3

# Alright but now you might be asking, how does it work?
# Well, let's take a look into a fake TIMER example

# We want to create a method that will calculate
# how long took to perform a task

# Live-code: let's code a timer method

def timer
  puts 'Starting task from METHOD!'
  start_time = Time.now

  # WE NEED TO RUN THE CODE INSIDE THE BLOCK
  yield
  puts 'BACK TO METHOD!'

  end_time = Time.now

  elapsed_time = end_time - start_time
  puts "It took #{elapsed_time} seconds"
end


timer do
  puts 'doing laundry FROM BLOCK!'
  sleep(2)
  puts 'Laundry done! zo/'
end


timer do
  puts 'Ending lecture!'
  sleep(2)
  puts 'Done!'
end


def number_of_times(number)
  (1..number).each do |n|
    yield(n)
  end
end

number_of_times(10) do |integer|
  puts integer
end


# Another example...
# Let's create a method to greet someone
def greet(name)
  # first thing, should we have a parameter?
  # this method should return
  #=> 'Good morning, someone's name!'
  yield(name)
  # "Good morning, #{name}"
  # The message above now will be defined
  # INSIDE THE BLOCK when calling the method
end

# Let's comment this out for a moment!

# puts greet('Qin')
# puts greet('Pedro')
# puts greet('Michael')

# What if we want now to be able to greet in different languages?
# Should we change the method name or make it customizable?

message = greet('Chloe') do |name|
  "Bounjour, #{name.upcase}! Fala portugues também ne?"
end

puts message
# Now to access the name passed as argument we need to PASS IT ALONG to the yield
# Doing that it will be available as the PIPE VARIABLE!
