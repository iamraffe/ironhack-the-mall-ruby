class Store
  attr_reader :name

  def initialize(name, items)
    @name = name
    @stock = do_inventory(items)
    @shopping_cart = ShoppingCart.new
  end
  
  def do_inventory(items)
    items.map{|item| {name: item.name, price: item.price, quantity: 5+rand(10)} }
  end

  def add_to_stock(item)
    @stock.push(item)
  end

  def update_stock

  end

  def print_available_actions
    puts "\nWhat do you feel like doing?\n1. View all store items\n2. View my shopping cart contents\n3. Add an item to cart\n4. Checkout & Pay\n5. Exit"
    user_input = gets.chomp.to_i
  end

  def show_store_items
    puts "STORE ITEMS:"
    @stock.each{|item| puts "--> Name: #{item[:name]} Price: #{item[:price]} Available: #{item[:quantity]}"}
  end

  def add_item_to_cart
    puts "SELECT THE ITEM YOU WANT TO PURCHASE"
    @stock.each_with_index{|item, index| puts "#{index+1}. Name: #{item[:name]} Price: #{item[:price]} Available: #{item[:quantity]}"}
    user_input = gets.chomp.to_i
    @shopping_cart.add_item(@stock[user_input-1])
  end

  def update_stock
    @stock.each do |item|
      if(@shopping_cart.items.include?(item))
        item[:quantity]-=1
      end
    end
  end

  def handle_guest(user_input)
    case user_input
      when 1
        show_store_items
      when 2
        @shopping_cart.show_contents
      when 3
        add_item_to_cart
      when 4
        update_stock
        @shopping_cart.checkout
        @exit = true
      when 5
        @exit = true
    end 
  end

  def welcome_guests
    @exit = false
    puts "Welcome to #{@name} dude!"
    while !@exit
      user_input = print_available_actions
      handle_guest(user_input)
    end
  end
end