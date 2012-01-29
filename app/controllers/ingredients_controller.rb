class IngredientsController < InheritedResources::Base
  defaults :finder => :find_by_slug

  actions :index, :show

  private
    def resource
      @ingredient ||= end_of_association_chain.includes(effects: {ingredients: :effects}).first
    end

    def collection
      @ingredients ||= end_of_association_chain.includes(:effects)
    end
end
