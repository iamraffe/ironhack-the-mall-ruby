require_relative "item.rb"

class Fruit < Item
  def price
    current_day = Time.now
    if(current_day != 0 || current_day != 6)
      @price - (@price * 0.1)
    end
  end
end