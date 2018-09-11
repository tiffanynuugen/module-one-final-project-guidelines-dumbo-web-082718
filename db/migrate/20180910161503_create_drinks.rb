class CreateDrinks < ActiveRecord::Migration[5.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :ingredients #we want to be able to add multiple ingredients
    end
  end
end
