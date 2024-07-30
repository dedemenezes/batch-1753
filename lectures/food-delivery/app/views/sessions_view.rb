class SessionsView
  def ask_for(anything)
    puts "#{anything.capitalize}?"
    return gets.chomp
  end

  def welcome_message
    puts "Welcome!"
  end

  def wrong_credentials
    puts 'Wrong credentials! Try again please...'
  end

  def list(employees)
    puts 'There are no riders' if employees.empty?
    employees.each do |employee|
      puts "#{employee.id} - #{employee.username}"
    end
  end
end
