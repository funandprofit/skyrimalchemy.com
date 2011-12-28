class IngredientsController < ApplicationController
  defaults :finder => :find_by_slug

  actions :index, :show
end
