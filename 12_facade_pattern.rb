class Order
  attr_accessor :address, :food, :payment

  def initialize(food)
    @food = food
  end
end

class FoodOrder 
  attr_reader :order

  def initialize(order)
    @order = order
  end

  def set_food(food)
    @order.food = food
  end

  def set_address(address)
    @order.address = address
  end

  def set_payment(payment)
    @order.payment = payment
  end

  def cek_order
    puts "Order   : #{@order.food}"
    puts "Address : #{@order.address}"
    puts "Payment Method: #{@order.payment}"
  end

  def execute_order
    puts "order #{order.food} ready for delivery"
  end
end

class FacadeFoodOrder
  attr_reader :food_order, :previous_order

  def initialize(order, previous_order)
    @food_order = FoodOrder.new(order)
    @previous_order = previous_order
  end

  def set_content_from_previous_order
    @food_order.set_address(@previous_order.order.address)
    @food_order.set_payment(@previous_order.order.payment)
    @food_order.cek_order
    @food_order.execute_order
  end
end

@pizza = Order.new('Pizza')
@first_order = FoodOrder.new(@pizza)
@first_order.set_address('customer address')
@first_order.set_payment('Master Card number abcd')
@first_order.cek_order
@first_order.execute_order

@cake = Order.new('Cake')
@second_order = FacadeFoodOrder.new(@cake, @first_order)
@second_order.set_content_from_previous_order

# program output
# Order   : Pizza
# Address : customer address
# Payment Method: Master Card number abcd
# order Pizza ready for delivery
# Order   : Cake
# Address : customer address
# Payment Method: Master Card number abcd
# order Cake ready for delivery


