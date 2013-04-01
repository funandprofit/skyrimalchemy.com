class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.includes(:dlc, :effects)
  end

  def show
    @ingredient = Ingredient.includes(:dlc, effects: {ingredients: :effects}).find_by_slug(params[:id])
    return render_404 unless @ingredient
  end
end
