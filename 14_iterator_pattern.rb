class MarketPlaceCollection
  attr_reader :store_iterators
  attr_accessor :stores
  
  def initialize(store_iterators)
    @store_iterators = store_iterators
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
    
    store_iterators.each do |store_iterator|
      while store_iterator.has_next?
        stores << store_iterator.next
      end
    end
    
    stores
  end
end

class ArrayIterator
  attr_reader :collection
  attr_accessor :current_index
  
  def initialize(collection)
    @collection = collection
    @current_index = 0
  end
  
  def has_next?
    current_index < collection.length
  end
  
  def next
    raise 'No more item left.' unless has_next?

    item = collection[current_index]
    self.current_index += 1
    item
  end 
end

class HashIterator
  attr_reader :collection, :keys
  attr_accessor :current_index
  
  def initialize(collection)
    @collection = collection
    @keys = collection.keys
    @current_index = 0
  end
  
  def has_next?
    current_index < keys.length
  end
  
  def next
    raise 'No more item left.' unless has_next?
    
    item = collection[keys[current_index]]
    self.current_index += 1
    item
  end 
end

# main program
market_place_one = [
  {
    item: 'Kindle PaperWhite',
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

market_place_one_iterator = ArrayIterator.new(market_place_one)
market_place_two_iterator = HashIterator.new(market_place_two)
market_place_iterators = [market_place_one_iterator,
  market_place_two_iterator]
market_collection = MarketPlaceCollection.new(market_place_iterators)
market_collection.item_list

# program output
# Kindle PaperWhite $ 175
# Samsung Soundbars $ 120
# Garmin Vivoactive 4 $ 200
# Blink Outdoor 3 Camera $ 130
# Samsonite Winfield 2 $ 570
# Nespresso Espresso Machine $ 130