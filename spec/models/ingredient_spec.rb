require 'spec_helper'

describe Ingredient do
  it 'creates a slug for the ingredient' do
    ingredient = Ingredient.make(:name => 'Some ingredient')
    ingredient.slug.should == 'some-ingredient'
  end

  context 'matching ingredients' do
    before do
      @foo = Ingredient.make(:name => 'Foo')
      @bar = Ingredient.make(:name => 'Bar')
      @baz = Ingredient.make(:name => 'Baz')

      @effects = 3.times.map { Effect.make }
    end

    it 'finds matching ingredients for an ingredient' do
      @foo.effects << @effects.first
      @bar.effects << @effects.first
      @baz.effects << @effects.last

      @foo.ingredient_matchers.should     include(@bar)
      @foo.ingredient_matchers.should_not include(@baz)
    end

    it 'finds ideal matching ingredients for an ingredient' do
      @foo.effects = @effects
      @bar.effects = @effects[0, 2]
      @baz.effects = @effects[0, 1]

      @foo.matching_ingredients.should     include(@bar)
      @foo.matching_ingredients.should_not include(@baz)
    end

    it 'sorts matching ingredients based of number of common effects' do
      @foo.effects = @effects
      @bar.effects = @effects[0, 2]
      @baz.effects = @effects

      @foo.matching_ingredients.should     == [@baz, @bar]
      @foo.matching_ingredients.should_not == [@bar, @baz]
    end
  end
end
