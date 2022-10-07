class AddPlaceToCocktail < ActiveRecord::Migration[7.0]
  def change
    add_column :cocktails, :place, :string
  end
end
