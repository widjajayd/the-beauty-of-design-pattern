class MarketPlaceCollection
  attr_reader :market_place_one, :market_place_two
  
  attr_accessor :stores
  
  def initialize(market_place_one, market_place_two)
    @market_place_one = market_place_one
    @market_place_two = market_place_two
    @stores = get_stores
  end

  def item_list
    stores.each do |store|
      puts "#{store[:item]} $ #{store[:price]}"
    end
  end
  
  private
  def get_stores
    # final result is array of hashes
    stores = []
    
    market_place_one.each do |store|
      stores << store
    end
    
    market_place_two.each do |id, store|
      stores << store
    end
       
    stores
  end
end

# main program
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

@market_collection = MarketPlaceCollection.new(market_place_one, market_place_two)
@market_collection.item_list

# program output
# Kindle Paper White $ 175
# Samsung Soundbars $ 120
# Garmin Vivoactive 4 $ 200
# Blink Outdoor 3 Camera $ 130
# Samsonite Winfield 2 $ 570
# Nespresso Espresso Machine $ 130