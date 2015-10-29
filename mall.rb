require_relative "store.rb"

class Mall
  def initialize(stores)
    @exit = false
    @stores = stores
    @manager = false
  end

  def manager?
    @manager
  end

  def print_available_actions
    puts "\nWhat do you feel like doing?\n1. View all stores\n2. Visit a store\n3. Exit\n "
    gets.chomp.to_i
  end

  def show_store_directory
    puts "STORE DIRECTORY:"
    @stores.each{|store| puts "--> #{store.name}"}
  end

  def visit_store
    puts "SELECT STORE YOU WANT TO ENTER"
    @stores.each_with_index{|store, index| puts "#{index+1}. #{store.name}"}
    user_input = gets.chomp.to_i
    @stores[user_input-1].welcome_guests(@manager)
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

  def define_user_type
    puts "\nPlease select the option that best describes your role here:\n1. Manager (Backend)\n2. Visitor (Frontend)"
    gets.chomp.to_i == 1 ? @manager = true : @manager = false
  end

  def welcome_guests
    puts "\n--------------------------------------------\n\nWelcome to the Diagon Alley Mall you muggle!"
    define_user_type
    while !@exit      
      user_input = print_available_actions
      handle_guest(user_input)
    end
  end 
end