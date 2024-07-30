require_relative '../views/sessions_view'

class SessionsController

  def initialize(employee_repository)
    @employee_repo = employee_repository
    @view = SessionsView.new
  end

  def login
    # 1. ask for the username (VIEW)
    username = @view.ask_for('username')
    # 2. Ask for the password
    password = @view.ask_for('password')
    # 3. Check if the employee exist in the DB(repository)
    employee = @employee_repo.find_by_username(username)
    # p employee
    # 4. IF the employee exist AND the password matches
    if employee && employee.password == password
      # 4.1 Print welcome message
      @view.welcome_message
      return employee
    else
      # 4 ELSE does not match or does not exist
      # 4.2 Display message wrong credentials (VIEW)
      @view.wrong_credentials
      # 4.3 We want to do everything again
      # Recursion!
      login
    end
  end
end
