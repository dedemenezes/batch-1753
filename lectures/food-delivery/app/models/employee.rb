class Employee
  attr_reader :username, :password, :role
  attr_accessor :id

  # STATE/Attributes
  # id -> Integer
  # username -> String
  # password -> String - 'secret' || '123456'
  # role -> String - 'manager' || "rider"
  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def rider?
    @role == 'rider'
  end

  def manager?
    @role == 'manager'
  end
end
