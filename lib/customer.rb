class Customer < ActiveRecord::Base
  has_many :drinks
  has_many :mixologists, through: :drinks
end
