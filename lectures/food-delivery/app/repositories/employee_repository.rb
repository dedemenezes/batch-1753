require 'csv'

class EmployeeRepository
  def initialize(csv_file_path)
    @csv_file = csv_file_path
    @employees = []
    # we should load all employees from the CSV
    load_csv
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
