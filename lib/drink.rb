class Drink < ActiveRecord::Base
  has_many :drink_lists
  has_many :customers, through: :drink_lists
  serialize :ingredients

  @@drinks = {}
  def self.get_list_of_drinks(alcohol)
    all_drinks = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{alcohol}")
    @@drinks = JSON.parse(all_drinks)
    drink_list = @@drinks["drinks"].map do |drink|
      drink["strDrink"]
    end
  end

  def self.choose_drink(drink_name)
    #set the array equal to some variable
    single_drink = @@drinks["drinks"].find {
        |drink_hash|
        drink_hash["strDrink"] == drink_name
      }
      # single_drink = the hash that matches the name of the drink
    number = single_drink["idDrink"]

    selected_drink = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{number}")
    drink_description = JSON.parse(selected_drink)
    drink_description["drinks"][0].select do |key, ingredient|
      key.include?("strIngredient") && (ingredient != "" && ingredient != nil)
    end.values
  end
# we're not creating instances of drinks, we're pulling from API
# database = stuff saved in secret ActiveRecord database
# drink_description has name and ingredients of the drink, need it to create instance of drink class
# have to grab the name and the ingredients, then Drink.create(name: adsfadsfa, ingredients: [adfad, adfadf, adfsd])
end #class end
