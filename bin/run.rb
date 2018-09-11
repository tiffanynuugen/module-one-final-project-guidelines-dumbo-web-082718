require_relative '../config/environment'
require_relative '../lib/drink.rb'

puts "Welcome to the Drink App!"
puts "What alcohol are you in the mood for?"
user_alcohol = gets.chomp
puts Drink.get_list_of_drinks(user_alcohol)

puts "What drink would you like to know more about?"
user_puts_name = gets.chomp
puts Drink.choose_drink(user_puts_name)
