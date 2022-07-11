class Chef
  attr_reader :name
  def initialize(name: )
    @name = name
  end
  def execute(customer: ,data: )
    puts "Chef #{name}, receive order from #{customer.name} to cook"
    data.each do |food|
      puts "  #{food}"
    end
  end
end

class Cashier
  attr_reader :name
  def initialize(name: )
    @name = name
  end
  def execute(customer: ,data: )
    puts "Cashier #{name}, process payment from #{customer.name}"
    data.each do |method_of_payment|
      puts "  #{method_of_payment}"
    end
  end
end

class DeliveryService
  attr_reader :name
  def initialize(name: )
    @name = name
  end
  def execute(customer: ,data: )
    puts "As an order from #{customer.name}, #{name} will deliver food to "
    data.each do |address|
      puts "  #{address}"
    end
  end
end

class Receptionist
  attr_reader :name, :request_list
  def initialize(name: )
    @name = name
    @request_list = []
  end
  def delegate_request
    @request_list.each do |request|
      request[:service].execute(customer: request[:customer], data: request[:data])
    end
  end
end

class Customer
  attr_reader :name
  def initialize(name:  )
    @name = name
  end
  def send_request(receptionist:, service:, data:)
    receptionist.request_list << {service: service, data: data, customer: self}
  end
end

@ann = Customer.new(name: 'Ann')
@chef = Chef.new(name: 'Ben')
@cashier = Cashier.new(name: 'Jen')
@delivery_service = DeliveryService.new(name: 'John' )
# ----------------- these part below is the key for command design pattern.
@anton = Receptionist.new(name: 'Anton')
@ann.send_request(receptionist: @anton,
                  service: @chef,
                  data: ['Fried Rice','Noodle Soup'])
@ann.send_request(receptionist: @anton,
                  service: @cashier,
                  data: ['Master Card Number 1234'])
@ann.send_request(receptionist: @anton,
                  service: @delivery_service,
                  data: ['Address number One','Address number Two']) 
@anton.delegate_request

# program output
# Chef Ben, receive order from Ann to cook
#   Fried Rice
#   Noodle Soup
# Cashier Jen, process payment from Ann
#   Master Card Number 1234
# As an order from Ann, John will deliver food to 
#   Address number One
#   Address number Two