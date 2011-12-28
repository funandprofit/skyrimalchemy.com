class EffectsController < ApplicationController
  actions :only => [:index, :show]
end
