class Employee
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
end
