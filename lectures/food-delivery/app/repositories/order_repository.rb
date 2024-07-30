require 'csv'
require_relative '../models/order'

class OrderRepository
  def initialize(orders_csv_file_path, meal_repository, customer_repository, employee_repository)
    @orders_csv_file_path = orders_csv_file_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    # we want to load the orders from the CSV
    load_csv if File.exist?(@orders_csv_file_path)
    @next_id = @orders.empty? ? 1 : @orders.last.id + 1
  end

  def create(order)
    order.id = @next_id
    @orders << order
    @next_id += 1
    save_csv
  end

  def find(id)
    @orders.find { |order| order.id == id }
  end

  def mark_as_delivered(id)
    # find the right order by the id
    order = find(id)
    # mark it as delivered
    order.deliver!
    # save it to the csv
    save_csv
  end

  def undelivered_orders_for(employee)
    # p employee
    undelivered_orders.select { |order| order.employee == employee }
    # @orders.reject { |order| order.delivered? && order.employee != employee }
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  private

  def save_csv
    CSV.open(@orders_csv_file_path, 'wb') do |file|
      # 1. push the headers to the csv
      file << [:id, :meal_id, :customer_id, :employee_id, :delivered]
      # 2. push all the orders to the csv
      @orders.each do |order|
        file << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered?]
      end
    end
  end

  def load_csv
    CSV.foreach(@orders_csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # 1. Convert the values to the right data type
      # In the CSV we have the meal ID
      # we need to convert it to the meal INSTANCE!
      # we need to find the right meal using the id from the csv file
      meal_id = row[:meal_id].to_i
      meal = @meal_repository.find(meal_id)
      # p meal
      customer_id = row[:customer_id].to_i
      customer = @customer_repository.find(customer_id)

      employee_id = row[:employee_id].to_i
      employee = @employee_repository.find(employee_id)

      delivered = row[:delivered] == 'true'
      # p row #=> #<CSV::Row id:"1" delivered:"false" meal_id:"1" customer_id:"1" employee_id:"2">


      # 2. Create the new order
      order = Order.new(
        id: row[:id].to_i,
        meal: meal,
        customer: customer,
        employee: employee,
        delivered: delivered
      )

      # p order
      # 3. Add to the orders array
      @orders << order
    end
  end
end
