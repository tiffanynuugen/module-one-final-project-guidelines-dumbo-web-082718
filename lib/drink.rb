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


  # a hash of all the drinks with that alcohol
  # we need to iterate over this hash with an array of hashes inside to find the
  # ID number and take the customer to that page with the ID number
  # hash of an array of a hash

  def self.choose_drink(drink_name)
    #set the array equal to some variable
    number = @@drinks["drinks"].find {|drink_hash| drink_hash["strDrink"] == drink_name}["idDrink"]
    selected_drink = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{number}")
    drink_description = JSON.parse(selected_drink).values
    drink_description.select do |key, ingredient|
      key.include?("strIngredient") && ingredient != ""
    end
  end

end #class end
