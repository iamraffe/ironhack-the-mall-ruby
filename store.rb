class Store
  attr_reader :name

  def initialize(name, items)
    @name = name
    @stock = do_inventory(items)
    @shopping_cart = ShoppingCart.new
    @balance = generate_balance
    @warehouse = Warehouse.new
    @min_stock = 5
  end

  def generate_balance
    10000 + rand(100000)
  end
  
  def do_inventory(items)
    items.map{|item| {item: item, stock: 5+rand(10)} }
  end

  def add_to_stock(item)
    @stock.push(item)
  end

  def update_stock

  end

  def show_balance
    puts "The store balance is: #{@balance} Gold Galleons"
  end

  def print_available_actions(is_manager)
    if is_manager
      puts "\nWhat do you feel like doing?\n1. View stock\n2. View store balance\n3. Exit"
      user_input = gets.chomp.to_i
    else
      puts "\nWhat do you feel like doing?\n1. View all store items\n2. View my shopping cart contents\n3. Add an item to cart\n4. Checkout & Pay\n5. Exit"
      user_input = gets.chomp.to_i
    end
  end

  def show_store_items
    puts "STORE ITEMS:"
    @stock.each{|stock_item| puts "--> Name: #{stock_item[:item].name} Price: #{stock_item[:item].price} Available: #{stock_item[:stock]}"}
  end

  def check_stock(item, quantity)
    authorize = true
    if(@shopping_cart.already_in_cart?(@stock[item-1][:item]))
      cart_item = @shopping_cart.items.find{|cart_item| cart_item[:item] == @stock[item-1][:item]} 
      if (cart_item[:quantity] + quantity) > @stock[item-1][:stock]
        puts "There are not enough items, select less"
        authorize = false
      end
    else
      if quantity > @stock[item-1][:stock]
        puts "There are not enough items, select less"
        authorize = false
      end
    end
    authorize
  end

  def select_item
    puts "SELECT THE ITEM YOU WANT TO PURCHASE"
    @stock.each_with_index{|stock_item, index| puts "#{index+1}. Name: #{stock_item[:item].name} Price: #{stock_item[:item].price} Available: #{stock_item[:stock]}"}
    gets.chomp.to_i
  end

  def select_qty
    puts "How many do you want?"
    gets.chomp.to_i
  end

  def add_item_to_cart
    selected_item =  select_item
    selected_quantity = select_qty
    @shopping_cart.add_item(@stock[selected_item-1][:item], selected_quantity) if check_stock(selected_item, selected_quantity)
  end

  def update_stock
    @shopping_cart.items.each do |cart_item|
      item = @stock.find{|stock_item| stock_item[:item] == cart_item[:item]}
      item[:stock]-=cart_item[:quantity]
    end
    restock if need_restock? 
  end

  def need_restock?
    need = false
    @stock.each do|item| 
      if item[:stock] < @min_stock
        need = true
      end    
    end
    need
  end

  def update_store_balance_after_checkout(money)
    @balance+=money.to_i
  end

  def update_store_balance_after_restock(stock_item)
    restock_cost = stock_item[:item].price * 5
    @balance-=restock_cost
  end

  def update_item_stock_after_restock(stock_item)
    stock_item[:stock]+=5
    # binding.pry
  end  

  def update_store_values(stock_item)
    update_store_balance_after_restock(stock_item)  
    update_item_stock_after_restock(stock_item)
  end

  def restock
    @stock.each do |stock_item| 
      if stock_item[:stock] < @min_stock && @warehouse.restock(stock_item, @balance)
        update_store_values(stock_item)
      else
        # puts "Somebody should let the manager know they don't have money to restock..."
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
        update_store_balance_after_checkout(@shopping_cart.checkout)
        @shopping_cart.reset_cart
        @exit = true
      when 5
        @exit = true
    end 
  end

  def handle_manager(user_input)
    case user_input
      when 1
        show_store_items
      when 2
        show_balance
      when 3
        @exit = true
    end 
  end

  def welcome_guests(is_manager)
    @exit = false
    puts "Welcome to #{@name} dude!"
    while !@exit
      user_input = print_available_actions(is_manager)
      is_manager ? handle_manager(user_input) : handle_guest(user_input)
    end
  end
end