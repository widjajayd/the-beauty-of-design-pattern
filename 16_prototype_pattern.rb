class Cake
  attr_reader :name, :fillings
  
  def initialize(name, fillings)
    @name = name
    @fillings = fillings
  end
end 

class CakeStoreDynamic
  attr_accessor :cake_prototype_collection
  
  def initialize
    @cake_prototype_collection = {}
  end

  def get_order(type)
    cake_prototype = cake_prototype_collection[type]
    raise 'unsupported cake type' unless cake_prototype
    
    @cake = cake_prototype.clone
  end

  def serve
    puts "Serve #{@cake.name} with topping #{@cake.fillings}"
  end
end  

# Main Program
@cake_store = CakeStoreDynamic.new
# 01. create_prototype
chocolate_cake_prototype = Cake.new('chocolate cake',['Chocolate'])
cheese_cake_prototype = Cake.new('cheese cake',['Cheese'])
fruit_cake_prototype = Cake.new('fruit cake',['mango','strawberry'])
# ----------------------------> these below code is the key for prototype pattern
# 02. since cake_prototype_collections is an hash
# we set key with name of cake
# we set value with an prototype object to be cloned later
@cake_store.cake_prototype_collection['chocolate'] = chocolate_cake_prototype # set prototype
@cake_store.cake_prototype_collection['cheese'] = cheese_cake_prototype # set prototype
@cake_store.cake_prototype_collection['fruit'] = fruit_cake_prototype
# 03. customer start to order 
@cake_store.get_order('chocolate') 
@cake_store.serve
@cake_store.get_order('cheese') 
@cake_store.serve
@cake_store.get_order('fruit')
@cake_store.serve

# program output
# Serve chocolate cake with topping ["Chocolate"]
# Serve cheese cake with topping ["Cheese"]
# Serve fruit cake with topping ["mango", "strawberry"]