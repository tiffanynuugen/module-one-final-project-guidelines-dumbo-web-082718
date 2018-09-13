class DrinkList < ActiveRecord::Base
  belongs_to :drink
  belongs_to :customer
end
