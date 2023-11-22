class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.integer :brand
      t.integer :model
      t.integer :year
      t.integer :range
      t.text :description

      t.timestamps
    end
  end
end
