class EffectsController < InheritedResources::Base
  defaults :finder => :find_by_slug

  actions :index, :show

  private
    def resource
      @effect ||= end_of_association_chain.includes(ingredients: :effects).first
    end

    def collection
      @effects ||= end_of_association_chain.includes(:ingredients)
    end
end
