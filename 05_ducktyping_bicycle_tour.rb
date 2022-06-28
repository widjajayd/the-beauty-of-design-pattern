class BicycleTour
  attr_reader :bicycle, :customer, :delivery_car

  def initialize(bicycle: ,customer: ,delivery_car: )
    @bicycle = bicycle
    @customer = customer
    @delivery_car = delivery_car
  end

  def prepare_tour(workers)
    workers.each do |worker|
      worker.prepare_tour(self)
    end
  end
end

class BikeRepairman
  attr_reader :name

  def initialize(name: )
    @name = name
  end

  def prepare_tour(tour)
    puts "Bike repairman #{name} fix #{tour.bicycle}"
  end

end

class Administrator
  attr_reader :name

  def initialize(name: )
    @name = name
  end

  def prepare_tour(tour)
    puts "Admin #{name} buys food for #{tour.customer}"
  end

end

class Driver
  attr_reader :name

  def initialize(name: )
    @name = name
  end

  def prepare_tour(tour)
    tune_up_car(tour.delivery_car)
    buy_gasoline
  end

  def tune_up_car(delivery_car)
    puts "Driver #{name} tune up #{delivery_car}"
  end

  def buy_gasoline
    puts "Driver #{name} buys gasoline"
  end

end

# main program
puts "Create an object for each worker"
puts "--------------------------------"
workers = Array.new
workers << BikeRepairman.new(name: "Ben")
workers << Administrator.new(name: "Jen")
workers << Driver.new(name: "Tim")
puts "Make a tour object."
puts "--------------------------------"
@tour_john = BicycleTour.new(
  bicycle: "Mountain Bike number 3", 
  customer: "John Doe", 
  delivery_car: "FORD 3551")
puts "Let's ask each worker to do the job."
puts "This is how duck typing can help"
puts "--------------------------------"
@tour_john.prepare_tour(workers)

# Output of program
# Create an object for each worker
# --------------------------------
# Make a tour object.
# --------------------------------
# Let's ask each worker to do the job.
# This is how duck typing can help
# --------------------------------
# Bike repairman Ben fix Mountain Bike
# Admin Jen buys food for John Doe
# Driver Tim tune up FORD 3551
# Driver Tim buys gasoline
# [Finished in 0.2s]