class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee

  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false # how to define an DEFAULT value for an attribute/state
  end

  def deliver!
    @delivered = true
  end

  def delivered?
    @delivered
  end
end
