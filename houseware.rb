require_relative "item.rb"

class Houseware < Item
  attr_accessor :name, :price

  def price
    if(@price > 100)
      @price - (@price * 0.05)
    end
    @price
  end
end