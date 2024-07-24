### NAMING CONVENTION ###
# file_name  -> singular && lower_snake_case
# class_name -> singular && UpperCamelCase
# file MUST have the same name of your class!

class Car
    # CONSTRUCTOR: gets called when Car.new
    # What is your class MADE OF!
  def initialize(color)
    # STATE/DATA -> sets the @instance_variables
    @engine_started = false
    @color = color
    @number_of_kilometers = 0
    @number_of_doors = 4
  end
  attr_reader :number_of_doors #:color, :number_of_kilometers
  # attr_writer :color, :number_of_kilometers
  attr_accessor :color, :number_of_kilometers #=> attr_reader + attr_writer

  # BEHAVIOR!
  ## instance method to perform custom behaviour on specific car ##
  # What your class CAN DO!
  def start_engine
    # some steps before we actually start the engine
    inject_fuel
    @engine_started = true
  end

  def engine_started?
    @engine_started
  end

  # DEFINE THE READERS/GETTERS!
  ## those are equivalent to attr_reader ##
  # instance method to expose value of @instance_variable
  # def color
  #   @color
  # end

  # def number_of_kilometers
  #   @number_of_kilometers
  # end

  # DEFINE A WRITER/SETTER
  ## those are equivalent to att_writer ##
  # def color=(new_color)
  #   @color = new_color
  # end

  # def number_of_kilometers=(new_kilometers)
  #   @number_of_kilometers = new_kilometers
  # end


  # everything below this keyword, will be only usable within the Class
  private
  # everything below here is PRIVATE
  def inject_fuel
    # simulaing!
    puts "INJECTING FUEL!!"
  end
end
