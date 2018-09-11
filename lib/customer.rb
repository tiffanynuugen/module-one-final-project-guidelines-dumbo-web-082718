class Customer < ActiveRecord::Base
  has_many :drink_lists
  has_many :drinks, through: :drink_lists

  #add new column, drinks ordered
end
