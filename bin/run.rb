require 'colorize'
require_relative '../config/environment'
require_relative '../lib/drink.rb'

puts "Welcome to the Drink App!".green

puts "What is your name?".green
user_name = gets.chomp
  if Customer.all.find_by name: user_name
    puts "Welcome back, #{user_name}.".green
  else
    Customer.create(name: user_name)
    puts "Hello #{user_name}.".green
  end

puts "What alcohol are you in the mood for?".green
user_alcohol = gets.chomp
puts Drink.get_list_of_drinks(user_alcohol)

puts "What drink would you like to know more about?".green
user_puts_name = gets.chomp
puts "The #{user_puts_name} has #{Drink.choose_drink(user_puts_name).join(", ")} in it.".green
puts "Is this the drink you would like to order?".green
# yes/no and then return to method if no
# if yes, give them that drink
#store the drink somewhere
