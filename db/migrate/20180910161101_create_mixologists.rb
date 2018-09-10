class CreateMixologists < ActiveRecord::Migration[5.0]
  def change
    create_table :mixologists do |t| #table helper
      t.string :name
      t.string :specialty
      t.integer :years_of_exp
    end 
  end
end
