class Human
  attr_reader :name

  def initialize(name: )
    @name = name
  end

  def talk
    puts "Hello my name is #{name}"
  end

end

class Cat
  attr_reader :name

  def initialize(name: )
    @name = name
  end

  def talk
    puts "Meauo Meauo Meauo"
  end

end

class Duck
  attr_reader :name

  def initialize(name: )
    @name = name
  end

  def talk
    puts "Kwek Kwek Kwek"
  end

end

# main program
puts "Let's ask all creatures to talk"
puts "--------------------------------"
@creatures = Array.new
@creatures << Human.new(name: "John")
@creatures << Cat.new(name: "Jerry")
@creatures << Duck.new(name: "Donald")

@creatures.each do |creature|
  creature.talk
end

# output of program
# Let's ask all creatures to talk
# --------------------------------
# Hello my name is John
# Meauo Meauo Meauo
# Kwek Kwek Kwek