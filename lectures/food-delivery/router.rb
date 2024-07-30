class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @sessions_controller = sessions_controller
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    print `clear`
    while @running
      title
      # WE MUST EXECUTE A LOGIN!
      # WE NEED A CONTROLLER THAT WILL KNOW HOW TO DO A LOIGN
      @current_employee = @sessions_controller.login
      # WHILE THE USER IS LOGGED IN!
      while @current_employee #=> is not nil!
        if @current_employee.role == 'manager'
          # puts 'Logged in as MANAGER!'
          display_manager_options
          action = gets.chomp.to_i
          dispatch_manager(action)
        else
          # puts 'Logged in as RIDER!'
          display_rider_options
          # get the rider action
          action = gets.chomp.to_i
          dispatch_rider(action)
          # if its not a manager
        end
      end
    end
    puts 'Bye!'
  end

  def stop!
    @current_employee = nil
    @running = false
  end

  def display_rider_options
    puts ' What do you want to do? '
    puts '1. List all my undelivered orders'
    puts '2. Mark an order as delivered'
    puts '9. Logout'
    puts '0. Exit'
  end

  def dispatch_rider(action)
    print `clear`
    case action
    when 1 then puts "TODO: list all my undelivered orders (controller)"
    when 2 then puts "TODO: mark one of my orders as delivered (controller)"
    when 9
      # we need to logout
      # loguout mean MAKE THE CURRENT EMPLOYEE VARIABLE nil
      @current_employee = nil
    when 0 then stop!
    else
      puts 'Invalid option!'
    end
  end

  def display_manager_options
    puts ' What do you want to do? '
    puts '1 - List all meals'
    puts '2 - Add a meal'
    puts '3 - Edit a meal'
    puts '4 - Delete a meal'
    puts '5 - List all customers'
    puts '6 - Add a customer'
    puts '7 - Edit a customer'
    puts '8 - Delete a customer'
    puts '0 - Exit'
    print '> '
  end

  def dispatch_manager(action)
    print `clear`
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.edit
    when 4 then @meals_controller.remove
    when 5 then @customers_controller.list
    when 6 then @customers_controller.add
    when 7 then @customers_controller.edit
    when 8 then @customers_controller.remove
    when 0 then stop!
    else
      puts 'Invalid option!'
    end
  end

  def title
    puts ''.center(40, '=')
    puts ' Batch #1753 '.center(40, '=')
    puts ''.center(40, '=')
    puts ''
  end
end
