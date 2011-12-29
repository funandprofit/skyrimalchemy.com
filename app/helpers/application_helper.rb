module ApplicationHelper
  def page_title
    case
      when @ingredients.present?
        'Skyrim Alchemy Ingredients'
      when @ingredient.present?
        "#{@ingredient.name} - Skyrim Alchemy Ingredients"
      when @effects.present?
        'Skyrim Alchemy Effects'
      when @effect.present?
        "#{@effect.name} - Skyrim Alchemy Effects"
      else
        'Skyrim Alchemy Ingredients'
    end
  end
end
