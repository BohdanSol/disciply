class ChangeBrandAndModelTypeInCars < ActiveRecord::Migration[7.0]
  def up
    change_column :cars, :brand, :integer
    change_column :cars, :model, :integer
  end

  def down
    change_column :cars, :brand, :string
    change_column :cars, :model, :string
  end
end
