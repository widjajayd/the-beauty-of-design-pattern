class PetrolMotorcycle
  attr_reader :motorcycle

  def initialize
    @motorcycle = ''
  end
  def build_frame
    motorcycle << "This is a petrol motorcycle\n"
  end
  def add_engine
    motorcycle << "  with an engine\n"
  end
  def add_wheels
    motorcycle << "  with front and rear wheels\n"
  end
  def add_dashboard
    motorcycle << "  with a dashboard that shows a petrol indicator.\n"
  end
  def add_energy_source
    motorcycle << "  with a fuel tank\n"
  end
end

class SportMotorcycle
  attr_reader :motorcycle

  def initialize
    @motorcycle = ''
  end
  def build_frame
    motorcycle << "This is a Sport Motorcycle\n"
  end
  def add_engine
    motorcycle << "  with a powerful engine\n"
  end
  def add_wheels
    motorcycle << "  with bigger front and rear wheels\n"
  end
  def add_dashboard
    motorcycle << "  with a futuristic dashboard\n"
  end
  def add_energy_source
    motorcycle << "  with a big fuel tank\n"
  end
end

class ElectricMotorcycle
  attr_reader :motorcycle

  def initialize
    @motorcycle = ''
  end

  def build_frame
    motorcycle << "This is an electric motorcycle\n"
  end

  def add_engine
    motorcycle << "  with a electric engine\n"
  end

  def add_wheels
    motorcycle << "  with front and rear wheels\n"
  end
  def add_dashboard
    motorcycle << "  with a digital dashboard showing current battery level\n"
  end
  def add_energy_source
    motorcycle << "  with a battery\n"
  end
end

class MotorcycleBuilderDirector
  def create_motorcycle(builder:)
    builder.build_frame
    builder.add_engine
    builder.add_wheels
    builder.add_dashboard
    builder.add_energy_source
    puts builder.motorcycle
  end
end

# Main Program
# -----------------------------------
# init template design
@petrol_motorcycle_template    = PetrolMotorcycle.new
@sport_motorcycle_template     = SportMotorcycle.new
@electric_motorcycle_template  = ElectricMotorcycle.new
# builder design pattern has builder Director
@builder_director = MotorcycleBuilderDirector.new
# create motorcycle based template passed
@petrol_motorcycle   = @builder_director.create_motorcycle(builder: @petrol_motorcycle_template)
@sport_motorcycle    = @builder_director.create_motorcycle(builder: @sport_motorcycle_template)
@electric_motorcycle = @builder_director.create_motorcycle(builder: @electric_motorcycle_template)

# program output
# -----------------------------------
# This is a petrol motorcycle
#   with an engine
#   with front and rear wheels
#   with a dashboard that shows a petrol indicator.
#   with a fuel tank
# This is a Sport Motorcycle
#   with a powerful engine
#   with bigger front and rear wheels
#   with a futuristic dashboard
#   with a big fuel tank
# This is an electric motorcycle
#   with a electric engine
#   with front and rear wheels
#   with a digital dashboard showing current battery level
#   with a battery
