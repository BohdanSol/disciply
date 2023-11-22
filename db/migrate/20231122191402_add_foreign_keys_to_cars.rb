class AddForeignKeysToCars < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :cars, :brands, column: :brand
    add_foreign_key :cars, :models, column: :model
  end
end
