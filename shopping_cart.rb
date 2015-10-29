class ShoppingCart
  attr_accessor :items, :total

  def initialize
    @items = []
    @total = 0
    @discount = 0
  end

  def print_cart_contents
    @items.each_with_index do |cart_item, index|
      @total+=(cart_item[:item].price.to_i * cart_item[:quantity])
      puts "#{index.to_i+1}. Item: #{cart_item[:item].name}. Price: #{cart_item[:item].price} Gold-Galleons. Quantity: #{cart_item[:quantity]}"
    end
  end

  def show_contents
    if @items.empty?
      puts "Your cart is empty my dear"
    else
      print_cart_contents
    end
  end

  def already_in_cart?(item)
    @items.any?{|cart_items| cart_items[:item] == item}
  end

  def update_item_qty(item, quantity)
    index = @items.index{|cart_items| cart_items[:item] == item} 
    @items[index][:quantity]+=quantity
  end

  def add_item(item, quantity)
    if already_in_cart?(item)
      update_item_qty(item, quantity)
    else
      @items.push({item: item, quantity: quantity})
    end
  end

  def discount_applies?
    @items.count > 5
  end

  def apply_discount
    @discount = @total -(@total * 0.1)
  end

  def reset_cart
    @items = []
    @total = 0
    @discount = 0
  end

  def checkout
    show_contents
    apply_discount if discount_applies?
    puts "Your total is: #{@total - @discount} Gold-Galleons"
    @total - @discount
  end
end