class Pizza
  attr_reader :variety

  def initialize(variety: )
    @variety = variety
  end

  def cook
    gather_ingredients
    prepare_the_dough
    puts 'Step 3: Set ingredients based variety'
    @variety.set_variety
    heat_and_enjoy
  end

  def gather_ingredients
    puts 'Step 1: Heat the souse while Chopping up ingredients'
  end

  def prepare_the_dough
    puts 'Step 2: Gently shape the dough'
  end

  def heat_and_enjoy
    puts 'Step 4: Heat to 425 for about 20-25 minutes'
    puts 'Enjoy the pizza'
    puts '----------------------------------------------------'
  end
end

class CapricciosaPizza
  def set_variety
    puts '  ham, mushrooms, artichokes, egg'
  end
end

class HawaiianPizza
  def set_variety
    puts '  ham, pineapple, bacon'
  end
end

class MargheeritaPizza
  def set_variety
    puts '  tomato, basil, mozzarella '
  end
end

@pizza = Pizza.new(variety: CapricciosaPizza.new)
@pizza.cook
@pizza = Pizza.new(variety: HawaiianPizza.new)
@pizza.cook

# program output
# Step 1: Heat the souse while Chopping up ingredients
# Step 2: Gently shape the dough
# Step 3: Set ingredients based variety
#   ham, mushrooms, artichokes, egg
# Step 4: Heat to 425 for about 20-25 minutes
# Enjoy the pizza
# ----------------------------------------------------
# Step 1: Heat the souse while Chopping up ingredients
# Step 2: Gently shape the dough
# Step 3: Set ingredients based variety
#   ham, pineapple, bacon
# Step 4: Heat to 425 for about 20-25 minutes
# Enjoy the pizza
# ----------------------------------------------------



