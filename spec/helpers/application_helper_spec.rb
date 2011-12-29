require 'spec_helper'

describe ApplicationHelper do
  it 'sets the correct page title' do
    @effect = Effect.make(:name => 'Foo')
    helper.page_title.should == 'Foo - Skyrim Alchemy Potion Effects'

    @effects = Effect.all
    helper.page_title.should == 'Skyrim Alchemy Potion Effects'

    @ingredient = Ingredient.make(:name => 'Bar')
    helper.page_title.should == 'Bar - Skyrim Alchemy Potion Ingredients'

    @ingredients = Ingredient.all
    helper.page_title.should == 'Skyrim Alchemy Potion Ingredients'
  end
end
