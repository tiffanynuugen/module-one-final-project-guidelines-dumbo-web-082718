class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
    end
  end
end

# grab customer id, drink id, and then create a new table and add a row to that table
# count for how many customer id appears
#
