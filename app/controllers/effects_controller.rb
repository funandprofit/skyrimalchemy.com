class EffectsController < InheritedResources::Base
  defaults :finder => :find_by_slug

  actions :index, :show

  private
    def collection
      @effects ||= end_of_association_chain.includes(:ingredients)
    end
end
