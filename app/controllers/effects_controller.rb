class EffectsController < InheritedResources::Base
  defaults :finder => :find_by_slug

  actions :index, :show

  private
    def resource
      @effect ||= end_of_association_chain.includes(ingredients: [:dlc, :effects]).send(method_for_find, params[:id])
    end

    def collection
      @effects ||= end_of_association_chain.includes(ingredients: :dlc)
    end
end
