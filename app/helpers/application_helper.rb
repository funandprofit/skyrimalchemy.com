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

  def menu_class(item)
    klass  = []
    klass << 'menu-wrapper'
    klass << item.to_s
    klass << 'active' if params[:controller] == item.to_s

    klass.join(' ')
  end

  def headline(obj)
    content_tag(:h3, obj.name + uesp_link(obj))
  end

  def uesp_link(obj)
    link_to '', obj.uesp_link, class: 'uesp', title: "See #{obj.name} on UESP"
  end

  def tooltip(ingredient)
    tooltip = [headline(ingredient), *ingredient.effects.map(&:name).join('<br>')]

    tooltip.join.html_safe
  end

  # (#{(ingredient.effects & @ingredient.effects).map(&:name).join(', ')})
  def effect_list(ingredient)
    (ingredient.effects & @ingredient.effects).inject([]) do |a, e|
      a << link_to(e.name, ingredient_path(e), class: 'effect tooltip')
    end.join(', ').html_safe
  end
end
