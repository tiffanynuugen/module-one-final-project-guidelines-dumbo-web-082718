require 'colorize'
require_relative '../config/environment'
require_relative '../lib/drink.rb'
require 'pry'

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
#puts Drink.get_list_of_drinks(user_alcohol)

prompt = TTY::Prompt.new
drink_choice = prompt.select("What drink would you like to know more about?".green, Drink.get_list_of_drinks(user_alcohol))
if Drink.get_list_of_drinks(user_alcohol)
  puts "The #{drink_choice} has #{Drink.choose_drink(drink_choice).join(", ")} in it."
else
end

# user_puts_name = gets.chomp
# puts "The #{user_puts_name} has #{Drink.choose_drink(user_puts_name).join(", ")} in it."
# puts ("Is this the drink you would like to order?").green
