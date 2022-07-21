
class MarketPlace
  def find_price(item_name)
    price = nil
    data.each do |product|
      price = product[:price] if product[:item] == item_name
    end
    price
  end
end

class MarketPlaceOne < MarketPlace
  attr_reader :data

  def initialize(data)
    @data = data
  end

end

class MarketPlaceTwo < MarketPlace
  attr_reader :data

  def initialize(data)
    @data = data
  end
end

class MarketPlaceProxy
  def initialize(market_place_one, market_place_two)
    @market_place_one = market_place_one
    @market_place_two = market_place_two
  end

  def can_access_market_place_one(user)
    user.has_password?
  end

  def can_access_market_place_two(user)
    user.has_password? && user.premium_member?
  end

  def find_price(user, item_name)
    price = nil
    price = @market_place_one.find_price(item_name) if can_access_market_place_one(user)
    price = @market_place_two.find_price(item_name) if can_access_market_place_two(user)
    if price
      puts "The price for #{item_name} is #{price} ~ for user #{user.name}"
    else
      puts "Sorry Cannot find the data ~ for user #{user.name}"
    end
  end
end

class User
  attr_reader :name
  def initialize(name: , password: , premium_member: )
    @name = name
    @password = password
    @premium_member = premium_member
  end

  def has_password?
    @password
  end

  def premium_member?
    @premium_member
  end
end
# main program
@john = User.new(name: 'John', password: true, premium_member: true)
@anne = User.new(name: 'Anne', password: true, premium_member: false)
@jenn = User.new(name: 'Jenn', password: false, premium_member: false)

# provide data for each market place
market_place_one = [
  {
    item: 'Kindle PaperWhite',
    price: 175
  },
  {
    item: 'Samsung Soundbars',
    price: 120
  }  
]
market_place_two = [
  {
    item: 'Garmin Vivoactive 4',
    price: 200
  },
  {
    item: 'Blink Outdoor 3 Camera',
    price: 130
  }  
]
# each user try to request data from market place
@market_place_one = MarketPlaceOne.new(market_place_one)
@market_place_two = MarketPlaceTwo.new(market_place_two)
@market_place_proxy = MarketPlaceProxy.new(@market_place_one, @market_place_two)
# market place proxy will decide based on user data
@market_place_proxy.find_price(@john, 'Garmin Vivoactive 4')
@market_place_proxy.find_price(@anne, 'Kindle PaperWhite')
@market_place_proxy.find_price(@anne, 'Garmin Vivoactive 4')
@market_place_proxy.find_price(@jenn, 'Kindle PaperWhite')
@market_place_proxy.find_price(@jenn, 'Garmin Vivoactive 4')
# program output
# The price for Garmin Vivoactive 4 is 200 ~ for user John
# The price for Kindle PaperWhite is 175 ~ for user Anne
# Sorry Cannot find the data ~ for user Anne
# Sorry Cannot find the data ~ for user Jenn
# Sorry Cannot find the data ~ for user Jenn