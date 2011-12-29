require 'spec_helper'

describe Ingredient do
  it 'creates a slug for the ingredient' do
    effect = Effect.make(:name => 'Some effect')
    effect.slug.should == 'some-effect'
  end
end
