require_relative "fruit.rb"
require_relative "item.rb"
require_relative "shopping_cart.rb"
require_relative "houseware.rb"

banana = Fruit.new("Banana", 10)
orange_juice = Item.new("Orange Juice", 10)
rice = Item.new("Rice", 1)
vacuum_cleaner = Houseware.new("Vacuum Cleaner", 150)
anchovies = Item.new("Anchovies", 2)

shopping_cart = ShoppingCart.new

puts "Welcome to the Walmart dude!"

begin
  exit = false

  puts """
What do you feel like doing?
  1. View all stores
  2. Checkout & Pay
  3. Exit
  """
  user_input = gets.chomp

  case user_input.to_i
    when 1
      is_adding_items = true

      begin
        puts """
Please select the item you wish to add to the shopping cart?
  1. Item: Banana             Price: 10 Gold-Galleons
  2. Item: Orange Juice       Price: 10 Gold-Galleons
  3. Item: Rice               Price: 1 Gold-Galleons
  4. Item: Vacuum Cleaner     Price: 150 Gold-Galleons
  5. Item: Anchovies          Price: 2 Gold-Galleons
  6. Exit
      """
        item_index = gets.chomp

        case item_index.to_i
          when 1
            shopping_cart.add_item(banana)
          when 2
            shopping_cart.add_item(orange_juice)
          when 3
            shopping_cart.add_item(rice)
          when 4
            shopping_cart.add_item(vacuum_cleaner)
          when 5
            shopping_cart.add_item(anchovies)
          when 6
            is_adding_items = false
          else
            puts "Bro, seriously, just select one of the options I don't have all day"
        end

      end while is_adding_items

    when 2
      shopping_cart.checkout
      exit = true

    when 3
      exit = true

    else
      puts "Bro, seriously, just select one of the options I don't have all day"
  end

end while exit === false