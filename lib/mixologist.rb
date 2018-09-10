class Mixologist < ActiveRecord::Base
  has_many :drinks
  has_many :customers, through: :drinks
end
