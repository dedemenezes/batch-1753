require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file_path)
    @csv_file = csv_file_path
    @employees = []
    # we should load all employees from the CSV
    load_csv if File.exist?(@csv_file)
  end

  def all_riders
    @employees.select { |employee| employee.rider? }
  end

  # Going through the employees repo and find an employee with an specific username
  def find_by_username(username)
    # 1. iterate over the employees array
    # 2. find the one that matches the username the user gave us
    @employees.find do |employee|
      # compare the actual employee username with the one the user gave us
      employee.username == username
    end
  end

  def find(id)
    @employees.find do |employee|
      employee.id == id
    end
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      # 1. Convert the values to right data type
      row[:id] = row[:id].to_i
      # p row #=> id:"2" username:"draco" password:"secret" role:"rider"
      # 2. Instantiate the new employee
      employee = Employee.new(row)
      # 3. Add the new employee to the array of employees
      @employees << employee
    end
  end
end
