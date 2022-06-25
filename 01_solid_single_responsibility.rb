# frozen_string_literal: true

# Single Responsibility
module SolidSingleResponsibility

  class RectangularPrismOne
    attr_reader :rectangle, :height

    def initialize(length,width,height)
      @length = length
      @width   = width
      @height  = height
      @rectangle = Rectangle.new(length,width)
    end

    def volume
      height * rectangle.total_area
    end

    Rectangle = Struct.new(:length, :width) do
      def total_area
        length * width
      end
    end
  end

  class Rectangle
    attr_reader :length, :width

    def initialize(length,width)
      @length = length
      @width   = width
    end

    def total_area
      length * width
    end
  end

  class RectangularPrismTwo
    attr_reader :height, :rectangle

    def initialize(height, rectangle=nil)
      @height = height
      @rectangle = rectangle  
    end

    def volume
      height * rectangle.total_area
    end
  end
end

# main program
puts "Solution 1: Mixed Responsibility"
puts "--------------------------------"
@prism_one = SolidSingleResponsibility::RectangularPrismOne.new(2,3,4)
puts "Total Area for rectangle:  #{@prism_one.rectangle.total_area}"
puts "Volume for prims one: #{@prism_one.volume}"
puts
puts "Solution 2: with 2 class and each has single responsibility"
puts "-----------------------------------------------------------"
@rectangle = SolidSingleResponsibility::Rectangle.new(2,3)
puts "Total area for rectangle: #{@rectangle.total_area}"
@prism_two = SolidSingleResponsibility::RectangularPrismTwo.new(4,@rectangle)
puts "Volume for prism two: #{@prism_two.volume}"
