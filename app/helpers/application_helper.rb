module ApplicationHelper
  def page_title
    case
      when @ingredients.present?
        'Skyrim Alchemy Potion Ingredients'
      when @ingredient.present?
        "#{@ingredient.name} - Skyrim Alchemy Potion Ingredients"
      when @effects.present?
        'Skyrim Alchemy Potion Effects'
      when @effect.present?
        "#{@effect.name} - Skyrim Alchemy Potion Effects"
    end
  end
end
