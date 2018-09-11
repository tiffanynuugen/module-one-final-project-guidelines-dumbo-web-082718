class Drink < ActiveRecord::Base
  belongs_to :mixologist
  belongs_to :customer
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
    number = @@drinks["drinks"].find {|drink_hash| drink_hash["strDrink"] == drink_name}["idDrink"]
    selected_drink = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{number}")
    drink_description = JSON.parse(selected_drink)
    results = drink_description["drinks"][0].select do |key, ingredient|
      key.include?("strIngredient") && ingredient != ""
      #we would expect to see a new hash consisting of {strIngredient2 => lemon, etc.}
    end
    results
  end

end #class end
