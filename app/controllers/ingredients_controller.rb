class IngredientsController < InheritedResources::Base
  defaults :finder => :find_by_slug

  actions :index, :show
end
