class EffectsController < ApplicationController
  def index
    @effects = Effect.includes(ingredients: :dlc)
  end

  def show
    @effect = Effect.includes(ingredients: [:dlc, :effects]).find_by_slug(params[:id])
    return render_404 unless @effect
  end
end
