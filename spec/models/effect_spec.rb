require 'spec_helper'

describe Effect do
  it 'creates a slug for the effect' do
    effect = Effect.make(:name => 'Some effect')
    effect.slug.should == 'some-effect'
  end
end
