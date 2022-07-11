class Cake
  attr_reader :name
  def initialize(name)
    @name = name
  end
  def serve
    puts name
  end
end

# -----------------> this is game changer class
class CakeDecorator
  attr_reader :cake

  def initialize(cake)
    @cake = cake
  end

  def serve
    @cake.serve
    puts "  Add #{topping} topping"
  end

  def topping
    raise NotImplementedError
  end
end

class ChocolateCake < CakeDecorator
  def topping
    'Chocolate'
  end
end

class CheeseCake < CakeDecorator
  def topping
    'Cheese'
  end
end

@standard_cake = Cake.new("Standard Cake")
@chocolate_cake = ChocolateCake.new(@standard_cake)
@chocolate_cake.serve
@cheese_cake = CheeseCake.new(@standard_cake)
@cheese_cake.serve

# this is the magic of decorator pattern
@chocolate_cheese_cake = CheeseCake.new(@chocolate_cake)
@chocolate_cheese_cake.serve

# program output
# Standard Cake
#   Add Chocolate topping
# Standard Cake
#   Add Cheese topping
# Standard Cake
#   Add Chocolate topping
#   Add Cheese topping