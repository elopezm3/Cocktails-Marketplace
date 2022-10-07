class AddUsersToCocktails < ActiveRecord::Migration[7.0]
  def change
    add_reference :cocktails, :user, null: false, foreign_key: true
  end
end
