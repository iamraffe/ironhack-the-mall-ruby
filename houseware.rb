require_relative "item.rb"

class Houseware < Item
  def price
    if(@price > 100)
      @price - (@price * 0.05)
    end
  end
end