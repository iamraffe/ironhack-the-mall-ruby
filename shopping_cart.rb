class ShoppingCart
  attr_accessor :items, :total

  def initialize
    @items = []
    @total = 0
  end

  def add_item(item)
    @items.push(item)
  end

  def discount_applies?
    @items.count > 5
  end

  def apply_discount
    @total -(@total * 0.1)
  end

  def checkout
    @items.each do |item, index|
      @total+=item.price
      puts "#{index.to_i+1}. Item: #{item.name}. Price: #{item.price} Gold-Galleons"
    end

    if discount_applies?
      @total = apply_discount
    end

    puts "Your total is: #{@total} Gold-Galleons"
  end
end