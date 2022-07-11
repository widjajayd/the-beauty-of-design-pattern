class Cake
  attr_reader :name
  def initialize(name)
    @name = name
  end
  def serve
    puts name
  end
end

class ChocolateCake
  attr_reader   :cake
  attr_accessor :topping

  def initialize(cake)
    @cake = cake
    @topping = 'Chocolate'
  end
  def serve
    cake.serve
    puts "  Add #{@topping} topping"
  end
end

class CheeseCake
  attr_reader   :cake
  attr_accessor :topping

  def initialize(cake)
    @cake = cake
    @topping = 'Cheese'
  end
  def serve
    cake.serve
    puts "  Add topping #{@topping}"
  end
end

@standard_cake = Cake.new("Standard Cake")
@chocolate_cake = ChocolateCake.new(@standard_cake)
@chocolate_cake.serve
@cheese_cake = CheeseCake.new(@standard_cake)
@cheese_cake.serve

# Program output
# Standard Cake
#   Add Chocolate topping
# Standard Cake
#   Add topping Cheese

