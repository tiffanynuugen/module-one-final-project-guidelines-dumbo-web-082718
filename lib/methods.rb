
# def start_music
#   pid = fork{ exec 'afplay', "/Users/jaekyungha/Documents/Flatiron/module-one-final-project-guidelines-dumbo-web-082718/lib/barmusic.mp3"}
# end

def start_program
pid = fork{ exec 'afplay', "/Users/jaekyungha/Documents/Flatiron/module-one-final-project-guidelines-dumbo-web-082718/lib/barmusic.mp3"}
puts "Welcome to the Drink App!".green

puts "What is your name?".green
@user_name = gets.chomp
  if Customer.all.find_by name: @user_name
      puts "Welcome back, #{@user_name}.".green
      @customer = Customer.all.find_by name: @user_name
  else
    puts "Hello #{@user_name}.".green
    @customer = Customer.find_or_create_by(name: @user_name)
    @customer.save
  end
end

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
    customer_answer = prompt.select("Is this the drink you would like to order?".green, %w(Yes No))
  end
end


def drink_is_made
 user_drink_list = DrinkList.find_or_create_by(customer: @customer, drink: @customers_drink_name)
puts "Please wait, your drink is being made."
sleep(1)
puts "Here is your drink."
sleep(1)
end

def list_of_drinks
  @list_of_drinks_to_delete = @customer.drinks.each do |drink_instance|
     puts drink_instance.name
   end
  @list_of_drinks_to_delete
end

def drink_list_names
  list_of_drinks.map do |drink_instance|
    drink_instance.name
  end
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
  list_of_drinks
  sleep(1)
  choices_in_drink_list
  # show drink list
when 3
  choose_drink_name
  drink_order_question
  next_choices
else
  puts "Thank you, see you again soon."
end
end

def choices_in_drink_list
  prompt = TTY::Prompt.new
  choices2 = {'Delete a drink' => 1, 'Go back'=> 2}
  round_three  = prompt.select("What would you like to do next?".green, choices2)
  case round_three
  when 1
    prompt = TTY::Prompt.new
    @delete_drink = prompt.select("What drink would you like to delete?".green, drink_list_names)
    @delete_need_drink_instance = Drink.all.find_by name: @delete_drink
    # DrinkList.destroy(DrinkList.where(customer_id: @customer.id, drink_id: @delete_need_drink_instance.id)[0].id)
    # Customer.drinks.destroy(@delete_drink)
    @customer.drinks.delete(@delete_need_drink_instance)
    next_choices
  when 2
    next_choices
  end
end
end
