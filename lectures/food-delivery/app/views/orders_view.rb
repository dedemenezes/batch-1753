class OrdersView
  def list(orders)
    puts 'There are no orders' if orders.empty?
    orders.each do |order|
      puts "#{order.id} - #{order.meal.name} ($#{order.meal.price}) | Customer: #{order.customer.name} | #{order.employee.username}"
    end
  end
end
