class CreateDrinkLists < ActiveRecord::Migration[5.0]
  def change
    create_table :drink_lists do |t| #table helper
      t.integer :customer_id
      t.integer :drink_id
    end
  end
end

#create a new list
