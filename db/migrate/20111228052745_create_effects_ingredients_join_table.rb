class CreateEffectsIngredientsJoinTable < ActiveRecord::Migration
  def change
    create_table :effects_ingredients, :id => false do |t|
      t.references :effect, :ingredient
    end
  end
end
