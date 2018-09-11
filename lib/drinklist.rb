class DrinkList < ActiveRecord::Base
  belongs_to :drinks
  belongs_to :customers
end
