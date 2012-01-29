class IngredientsController < InheritedResources::Base
  defaults :finder => :find_by_slug

  actions :index, :show

  private
    def resource
      @ingredient  ||= end_of_association_chain.includes(effects: {ingredients: :effects}).send(method_for_find, params[:id])
    end

    def collection
      @ingredients ||= end_of_association_chain.includes(:effects)
    end
end
