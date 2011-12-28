class IngredientsController < ApplicationController
  actions :only => [:index, :show]
end
