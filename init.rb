require "pry"

require_relative "fruit.rb"
require_relative "item.rb"
require_relative "shopping_cart.rb"
require_relative "houseware.rb"
require_relative "mall.rb"
require_relative "store.rb"

# Fruit place
banana = Fruit.new("Banana", 10)
apple = Fruit.new("Apple", 9)
passion_fruit = Fruit.new("Passion Fruit", 5)
coconut = Fruit.new("Coconut", 6)
berry = Fruit.new("Berry", 2)

fruit_place = Store.new("Da Frut Wida Juz", [banana, apple, passion_fruit, coconut, berry])

# Supermarket
orange_juice = Item.new("Orange Juice", 10)
rice = Item.new("Rice", 1)
anchovies = Item.new("Anchovies", 2)
bacon = Item.new("Bacon", 50)
pizza = Item.new("Pizza", 20)

supermarket = Store.new("The SuperSuperMarket", [orange_juice, rice, anchovies, bacon, pizza])

# Hardware store
vacuum_cleaner = Houseware.new("Vacuum Cleaner", 150)
hammer = Houseware.new("Hammer", 25)
screwdriver = Houseware.new("Screwdriver", 15)
broom = Houseware.new("Broom", 10)
shovel = Houseware.new("Shovel", 30)

hardware_store = Store.new("Morning Wood", [vacuum_cleaner, hammer, screwdriver, broom, shovel])

Mall.new([fruit_place, supermarket, hardware_store]).welcome_guests
puts "Don't be a stranger!"

# shopping_cart = ShoppingCart.new

# puts "Welcome to the Walmart dude!"

# begin
#   exit = false

#   puts """
# What do you feel like doing?
#   1. View all stores
#   2. Checkout & Pay
#   3. Exit
#   """
#   user_input = gets.chomp

#   case user_input.to_i
#     when 1
#       is_adding_items = true

#       begin
#         puts """
# Please select the item you wish to add to the shopping cart?
#   1. Item: Banana             Price: 10 Gold-Galleons
#   2. Item: Orange Juice       Price: 10 Gold-Galleons
#   3. Item: Rice               Price: 1 Gold-Galleons
#   4. Item: Vacuum Cleaner     Price: 150 Gold-Galleons
#   5. Item: Anchovies          Price: 2 Gold-Galleons
#   6. Exit
#       """
#         item_index = gets.chomp

#         case item_index.to_i
#           when 1
#             shopping_cart.add_item(banana)
#           when 2
#             shopping_cart.add_item(orange_juice)
#           when 3
#             shopping_cart.add_item(rice)
#           when 4
#             shopping_cart.add_item(vacuum_cleaner)
#           when 5
#             shopping_cart.add_item(anchovies)
#           when 6
#             is_adding_items = false
#           else
#             puts "Bro, seriously, just select one of the options I don't have all day"
#         end

#       end while is_adding_items

#     when 2
#       shopping_cart.checkout
#       exit = true

#     when 3
#       exit = true

#     else
#       puts "Bro, seriously, just select one of the options I don't have all day"
#   end

# end while exit === false

