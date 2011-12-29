require 'spec_helper'

describe IngredientsController do
  render_views

  before do
    @ingredient         = Ingredient.make(:name => 'Example ingredient')
    @ingredient.effects = 3.times.map { Effect.make }
  end

  describe 'GET index' do
    it 'lists ingredients' do
      get :index
      response.body.should =~ /\/ingredients\/example-ingredient/m
      response.body.should =~ /Example ingredient/m
    end
  end

  describe 'GET show' do
    before(:each) do
      get :show, {:id => @ingredient}
    end

    it 'displays the ingredient name and UESP link' do
      response.body.should =~ /<h1>Example ingredient/m
      response.body.should =~ /#{@ingredient.uesp_link}/m
    end

    it 'displays the ingredient\'s effects' do
      @ingredient.effects.each do |effect|
        response.body.should =~ /\/effects\/#{effect.to_param}/m
        response.body.should =~ /#{effect.name}/m
      end
    end
  end
end
