class Customer < ActiveRecord::Base
  has_many :drink_lists
  has_many :drinks, through: :drink_lists
  #@customer.drinks gives us all the drinks that belong to a customer without
  #the long method
  #add new column, drinks ordered

  # def see_drink_list
  #   drink_list =
    #iterate over the database and pull all drink names?

end
