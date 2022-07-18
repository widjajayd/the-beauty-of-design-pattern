class Cake
  attr_reader :name, :fillings
  
  def initialize(name, fillings)
    @name = name
    @fillings = fillings
  end
end  

class CakeStore
  def get_order(type)
    case type
    when 'chocolate'
      @cake = Cake.new('Chocolate cake', ['chocolate'])
      # create cake object here
    when 'cheese'
      @cake = Cake.new('Cheese cake', ['cheese'])
    else
      @cake = Cake.new('Standard cake', [''])
    end
  end

  def serve
    puts "Serve #{@cake.name} with topping #{@cake.fillings}"
  end
end

# main program
@cake_store = CakeStore.new
@cake_store.get_order('chocolate')
@cake_store.serve
@cake_store.get_order('cheese')
@cake_store.serve

# program output
# Serve Chocolate cake with topping ["chocolate"]
# Serve Cheese cake with topping ["cheese"]