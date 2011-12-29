require 'spec_helper'

describe EffectsController do
  render_views

  before do
    @effect             = Effect.make(:name => 'Example effect')
    @effect.ingredients = 3.times.map { Ingredient.make }
  end

  describe 'GET index' do
    it 'lists effects' do
      get :index
      response.body.should =~ /\/effects\/example-effect/m
      response.body.should =~ /Example effect/m
    end
  end

  describe 'GET show' do
    before(:each) do
      get :show, {:id => @effect}
    end

    it 'displays the effect name and UESP link' do
      response.body.should =~ /<h1>Example effect/m
      response.body.should =~ /#{@effect.uesp_link}/m
    end

    it 'displays the effect\'s ingredients' do
      @effect.ingredients.each do |ingredient|
        response.body.should =~ /\/ingredients\/#{ingredient.to_param}/m
        response.body.should =~ /#{ingredient.name}/m
      end
    end
  end
end
