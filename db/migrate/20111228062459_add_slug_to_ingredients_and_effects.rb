class AddSlugToIngredientsAndEffects < ActiveRecord::Migration
  def change
    add_column :effects, :slug, :string
    add_column :ingredients, :slug, :string
  end
end
