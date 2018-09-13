# create methods separately and then require them here

require 'colorize'
require_relative '../config/environment'
require_relative '../lib/drink.rb'
require_relative '../lib/methods.rb'
require 'pry'

puts "Welcome to the Drink App!".green

puts "What is your name?".green
@user_name = gets.chomp
@customer = Customer.find_or_create_by(name: @user_name)
  if Customer.all.find_by name: @user_name
      puts "Welcome back, #{@user_name}.".green
  else
    @customer = Customer.create(name: @user_name)
    puts "Hello #{@user_name}.".green
    @customer.save
  end

choose_alcohol
choose_drink_name
drink_order_question
drink_is_made
next_choices






# def choose_alcohol
# puts "What alcohol are you in the mood for?".green
# user_alcohol = gets.chomp
# puts Drink.get_list_of_drinks(user_alcohol)
# end
#
# def choose_drink_name
# prompt = TTY::Prompt.new
# drink_choice = prompt.select("What drink would you like to know more about?".green, Drink.get_list_of_drinks(user_alcohol))
# if Drink.get_list_of_drinks(user_alcohol)
#   puts "The #{drink_choice} has #{Drink.choose_drink(drink_choice).join(", ")} in it."
# else
# end
# end
#
# def drink_order_question
# customer_answer = prompt.select("Is this the drink you would like to order?".green, %w(Yes No))
# while customer_answer == "No"
#   if customer_answer == "Yes"
#   else
#     drink_choice = prompt.select("What drink would you like to know more about?".green, Drink.get_list_of_drinks(user_alcohol))
#     Drink.get_list_of_drinks(user_alcohol)
#       puts "The #{drink_choice} has #{Drink.choose_drink(drink_choice).join(", ")} in it."
#       customer_answer = prompt.select("Is this the drink you would like to order?".green, %w(Yes No))
#   end
# puts "Please wait, your drink is being made."
# sleep(2)
# #return photo of drink
# puts "Here is your drink."
# sleep(2)
# end
#
# def next_choices
# choices = {'Choose another alcohol' => 1, 'See my drink list'=> 2, 'Go back' => 3, 'Exit' => 4}
#
# round_two = prompt.select("What would you like to do next?".green, choices)
# if round_two == 1
#   choose_alcohol
#   # run things from beginning
# elsif round_two == 2
#   # show drink list
# elsif round_two == 3
# else
# end
# end
# end
