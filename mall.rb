require_relative "store.rb"

class Mall
  def initialize(stores)
    @exit = false
    @stores = stores
  end

  def print_available_actions
    puts "\nWhat do you feel like doing?\n1. View all stores\n2. Visit a store\n3. Exit"
    user_input = gets.chomp.to_i
  end

  def show_store_directory
    puts "STORE DIRECTORY:"
    @stores.each{|store| puts "--> #{store.name}"}
  end

  def visit_store
    puts "SELECT STORE YOU WANT TO ENTER"
    @stores.each_with_index{|store, index| puts "#{index+1}. #{store.name}"}
    user_input = gets.chomp.to_i
    @stores[user_input-1].welcome_guests
  end

  def handle_guest(user_input)
    case user_input
      when 1
        show_store_directory
      when 2
        visit_store
      when 3
        @exit = true
    end 
  end

  def welcome_guests
    puts "Welcome to the Walmart dude!"
    while !@exit
      user_input = print_available_actions
      handle_guest(user_input)
    end
  end 
end