require 'pry'
def choose_alcohol
puts "What alcohol are you in the mood for?".green
@user_alcohol = gets.chomp
#puts Drink.get_list_of_drinks(@user_alcohol)
end
@user_alcohol

def choose_drink_name
prompt = TTY::Prompt.new
@drink_choice = prompt.select("What drink would you like to know more about?".green, Drink.get_list_of_drinks(@user_alcohol))
@customers_drink_name = Drink.find_or_create_by(name: @drink_choice)
if Drink.get_list_of_drinks(@user_alcohol)
  puts "The #{@drink_choice} has #{Drink.choose_drink(@drink_choice).join(", ")} in it."
else
end
end

def drink_order_question
  prompt = TTY::Prompt.new
customer_answer = prompt.select("Is this the drink you would like to order?".green, %w(Yes No))
until customer_answer == "Yes"
  if customer_answer == "Yes"
  else
    choose_drink_name
    # @drink_choice = prompt.select("What drink would you like to know more about?".green, Drink.get_list_of_drinks(@user_alcohol))
    # Drink.get_list_of_drinks(@user_alcohol)
    #   puts "The #{@drink_choice} has #{Drink.choose_drink(@drink_choice).join(", ")} in it."
      # binding.pry
    customer_answer = prompt.select("Is this the drink you would like to order?".green, %w(Yes No))
  end
end


def drink_is_made
 user_drink_list = DrinkList.find_or_create_by(customer: @customer, drink: @customers_drink_name)
puts "Please wait, your drink is being made."
sleep(2)
puts "Here is your drink."
sleep(2)
end

def next_choices
  prompt = TTY::Prompt.new
choices = {'Choose another alcohol' => 1, 'See my drink list'=> 2, 'Go back' => 3, 'Exit' => 4}
round_two = prompt.select("What would you like to do next?".green, choices)
case round_two
when 1
  choose_alcohol
  choose_drink_name
  drink_order_question
  drink_is_made
  next_choices
when 2
 @customer.drinks.each do |drink_instance|
    puts drink_instance.name
  end
  # show drink list
when 3
  choose_drink_name
  drink_order_question
  next_choices
else
  puts "Thank you, see you again soon."
end
end
end
