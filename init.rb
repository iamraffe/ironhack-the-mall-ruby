require "pry"

require_relative "fruit.rb"
require_relative "item.rb"
require_relative "shopping_cart.rb"
require_relative "houseware.rb"
require_relative "mall.rb"
require_relative "store.rb"
require_relative "warehouse.rb"
require_relative "user.rb"
require_relative "manager.rb"

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


