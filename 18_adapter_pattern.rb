# using array of hashes
class MarketPlaceOne
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def item_list(stores)
    stores.each do |store|
      puts "#{store[:item]} $ #{store[:price]}"
    end
  end
end

# using different format hashes of array (more complex)
class MarketPlaceTwo
  attr_reader :data

  def initialize(data)
    @data = data
  end
end

class Adapter
  attr_reader :market_place
  
  def initialize(market_place)
    @market_place = market_place
  end
  
  # this method below will do conversion process
  def data
    arr = []
    @market_place.data.each do |item|
      arr << item[1]
    end
    arr
  end

end

market_place_one = [
  {
    item: 'Kindle Paper White',
    price: 175
  },
  {
    item: 'Samsung Soundbars',
    price: 120
  },
  {
    item: 'Garmin Vivoactive 4',
    price: 200
  },
  {
    item: 'Blink Outdoor 3 Camera',
    price: 130
  }  
]

market_place_two = {
  0 => {
    item: 'Samsonite Winfield 2',
    price: 570
  },
  1 => {
    item: 'Nespresso Espresso Machine',
    price: 130
  }
}

# main program
@market_place_one = MarketPlaceOne.new(market_place_one)
@market_place_one.item_list(@market_place_one.data)
@market_place_two = MarketPlaceTwo.new(market_place_two)
# ----------------------> this line below will result an error
# @market_place_one.item_list(@market_place_two.data) 
@adapter = Adapter.new(@market_place_two) # we need help from adapter
@market_place_one.item_list(@adapter.data)

# program output
# Kindle Paper White $ 175
# Samsung Soundbars $ 120
# Garmin Vivoactive 4 $ 200
# Blink Outdoor 3 Camera $ 130
# Samsonite Winfield 2 $ 570
# Nespresso Espresso Machine $ 130
