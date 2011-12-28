class EffectsController < ApplicationController
  defaults :finder => :find_by_slug

  actions :index, :show
end
