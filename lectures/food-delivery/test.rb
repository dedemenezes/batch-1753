require_relative './app/models/employee'
require_relative './app/repositories/employee_repository'

employee = Employee.new({ id: 1, username: 'hermione', password: 'secret', role: 'manager'})
p employee

employee_csv_path = './data/employees.csv'
employee_repository = EmployeeRepository.new(employee_csv_path)
p employee_repository
