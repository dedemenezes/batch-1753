require 'pry-byebug'
# it allow us to create BREAKPOINT!

def full_name(first_name, last_name)
  # 1. capitalize the first name
  capitalized_first_name = first_name.capitalize
  binding.pry
  # 2. capitalize the last name
  capitalized_last_name = last_name.capitalize
  # create a breakpoint
  binding.pry
  return "#{capitalized_first_name} #{capitalized_last_name}"
end
#=> Andre Menezes


full_name('aNdRe', 'mEnEzEs')
# continue goes to the next binding.pry IF PRESENT
# next runs the next line
