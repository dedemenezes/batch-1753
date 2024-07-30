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
end
