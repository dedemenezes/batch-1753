require_relative '../views/meals_view'
require_relative '../views/orders_view'
require_relative '../views/customers_view'
require_relative '../views/sessions_view'
require_relative '../models/order'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @meal_view = MealsView.new
    @customer_view = CustomersView.new
    @sessions_view = SessionsView.new
    @orders_view = OrdersView.new
  end
  def add
    # 1. Select the meal for this NEW ORDER
    # 1.1 display all the meals
    # Ask the meal repository for all the meals
    all_meals = @meal_repository.all
    # Display them for the user
    @meal_view.list(all_meals)
    # 1.2. Ask for the index (number)
    meal_id = @meal_view.ask_user_for('id').to_i
    # 1.3 Retrieve the right meal instance from all the meals by the id
    meal = @meal_repository.find(meal_id)
    # p meal

    # 2. Select the customer for this NEW ORDER
    # 2.1. display all the customer
    # 2.2 ask for the customer id
    # 2.3 retrieve the right customer from the repository
    all_customers = @customer_repository.all
    # Display them for the user
    @customer_view.list(all_customers)
    # 1.2. Ask for the index (number)
    customer_id = @customer_view.ask_user_for('id').to_i
    # 1.3 Retrieve the right customer instance from all the customers by the id
    customer = @customer_repository.find(customer_id)
    # p customer

    # 3. Select the employee - the employee MUST BE A RIDER
    # Display all the RIDERS!
    all_riders = @employee_repository.all_riders
    # Display them for the user
    @sessions_view.list(all_riders)
    # Ask for the rider id
    rider_id = @sessions_view.ask_for('id').to_i
    # Retrieve the right rider!
    rider = @employee_repository.find(rider_id)
    p meal
    p customer
    p rider
    # 4. Instantiate the NEW ORDER

    order = Order.new(meal: meal, customer: customer, employee: rider)
    p order
    # 5. Ask the repository to actually CREATE!
    @order_repository.create(order)
  end

  def list_undelivered_orders
    # 1. Get all the orders that are not delivered
    orders_not_delivered = @order_repository.undelivered_orders
    # 2. Dislpay them to the user
    @orders_view.list(orders_not_delivered)
  end

  def list_my_orders(employee)
    # p employee
    # 1. Retrieve all the order for the LOGGED IN RIDER!
    orders = @order_repository.undelivered_orders_for(employee)
    # p orders
    # needs to know WHO IS LOGGED IN

    # 2. Display those to the user
    @orders_view.list(orders)
  end

  def mark_as_delivered(employee)
    # 1. Dislpay all the undelivered
    orders = @order_repository.undelivered_orders_for(employee)
    @orders_view.list(orders)
    # 2. Ask for the rider which one to mark
    order_id = @sessions_view.ask_for('id').to_i
    @order_repository.mark_as_delivered(order_id)
  end
end
