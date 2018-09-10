
class Drink < ActiveRecord::Base
  belongs_to :mixologist
  belongs_to :customer
  serialize :ingredients

  @@drinks = {}
  def self.get_list_of_drinks(alcohol)
    all_drinks = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{alcohol}")
    @@drinks = JSON.parse(all_drinks)
    @@drinks["drinks"].map do |drink|
      drink["strDrink"]
    end
  end

  def self.all
    @@drinks #a hash of all the drinks with that alcohol
    #we need to iterate over this hash with an array of hashes inside to find the
    #ID number and take the customer to that page with the ID number
  end
  #hash of an array of a hash

  def self.choose_drink(alcohol)
    @@drinks.collect do |key, value|
      value.collect do |key2, value2|
        value2.idDrink
      end
    end
  end

end
