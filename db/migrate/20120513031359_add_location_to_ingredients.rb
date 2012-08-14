class AddLocationToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :location, :text
  end
end
