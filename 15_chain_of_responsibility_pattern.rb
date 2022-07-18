require 'date'

class Customer
  attr_reader :name, :order_date

  def initialize(name: ,order_date:)
    @name = name
    @order_date = order_date
  end

  def get_discount(chain: )
    puts "#{name} get discount: #{chain.find_discount(customer: self) * 100}%"
  end
end

class Discount
  attr_reader :next_chain
  def initialize(next_chain = nil)
    @next_chain = next_chain
  end
  def find_discount(customer: )
    return next_chain.find_discount(customer: customer) unless can_process?(customer)
    # if can_process? return true then it will return discount_percentage (below)
    # if not then it will pass to next_chain
    discount_percentage
  end
end

class CompanyBirthdayDiscount < Discount
  private
  def discount_percentage
    0.3
  end
  def can_process?(customer)
    customer.order_date.day == 17 && customer.order_date.month == 4 
  end
end

class NewYearDay < Discount
  private
  def discount_percentage
    0.1
  end
  def can_process?(customer)
    customer.order_date.day == 1 && customer.order_date.month == 1
  end
end

class DefaultDiscount < Discount
  private
  def discount_percentage
    0.05
  end
  def can_process?(customer)
    true
  end
end

# ----------------------> this is the key for chain of responsibility
# Most Left chain is number one priority 
@chain = CompanyBirthdayDiscount.new(NewYearDay.new(DefaultDiscount.new))
# create customers with different order date
@john = Customer.new(name: "John", order_date: Date.new(2022,4,17))
@jane = Customer.new(name: "Jane", order_date: Date.new(2022,1,1))
@alex = Customer.new(name: "Alex", order_date: Date.new(2022,4,19))
# search discount
@john.get_discount(chain: @chain)
@jane.get_discount(chain: @chain)
@alex.get_discount(chain: @chain)

# program output
# John get discount: 30.0%
# Jane get discount: 10.0%
# Alex get discount: 5.0%