class Citizen
  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def can_vote?
    @age >= 16
    # if @age >= 16
    #   return true
    # else
    #   return false
    # end
  end

  def full_name
    "#{@first_name.capitalize} #{@last_name.capitalize}"
  end
end

Citizen.new('Diana', 'Saddi', 25)
