class IngredientsController < InheritedResources::Base
  defaults :finder => :find_by_slug

  actions :index, :show

  private
    def collection
      @ingredients ||= end_of_association_chain.includes(:effects)
    end
end
