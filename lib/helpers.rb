module Helpers
  def menu_class(item)
    klass  = []
    klass << 'menu-wrapper'
    klass << item.to_s
    klass << 'active' if current_page.path.start_with?(item.to_s)
    klass.join(' ')
  end

  def effects_for(ingredient)
    ingredient.effects.map do |effect|
      data.effects.find { |e| effect.id == e.id }
    end
  end

  def ingredients_for(effect)
    effect.ingredients.map do |ingredient|
      data.ingredients.find { |i| ingredient.id == i.id }
    end
  end

  def matching_ingredients_for(ingredient)
    unique_matchers = ingredient.ingredient_matchers.uniq do |matching_ingredient|
      matching_ingredient.id
    end

    matchers_with_effects = unique_matchers.map do |matching_ingredient|
      data.ingredients.find { |i| matching_ingredient.id == i.id }
    end

    matchers_with_effects.select do |matching_ingredient|
      (ingredient.effects & matching_ingredient.effects).count > 1
    end
  end

  def matching_effects_list(ingredient, matching_ingredient)
    (ingredient.effects & matching_ingredient.effects).map do |effect|
      link_to(effect.name, "/effects/#{effect.slug}", class: 'effect tooltip')
    end.join(', ').html_safe
  end

  def ingredient_tooltip(ingredient)
    [
      content_tag(:h3, ingredient.name + uesp_link(ingredient).gsub('"', "'")),
      *ingredient.effects.map do |effect|
        link_to(effect.name, "/effects/#{effect.slug}").gsub('"', "'")
      end.join('<br>')
    ].join
  end

  def effect_tooltip(effect)
    [
      content_tag(:h3, effect.name + uesp_link(effect).gsub('"', "'")),
      *effect.ingredients.map do |ingredient|
        link_to(ingredient.name, "/ingredients/#{ingredient.slug}").gsub('"', "'")
      end.join('<br>')
    ].join
  end

  def uesp_link(obj)
    link_to '', obj.uesp_link, class: 'uesp', title: "See #{obj.name} on UESP"
  end

  def facebook_like
    '<iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fskyrimalchemy.com&amp;send=false&amp;layout=button_count&amp;width=100&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font=arial&amp;height=21" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:80px; height:20px;" allowTransparency="true"></iframe>'.html_safe
  end

  def tweet_this
    '<a href="https://twitter.com/share" class="twitter-share-button" data-url="http://skyrimalchemy.com" data-hashtags="skyrimalchemy">Tweet</a><script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>'.html_safe
  end

  def analytics_code
    property_id = 'UA-28186953-2'
    "<script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      ga('create', '#{property_id}', 'auto');
      ga('send', 'pageview');
    </script>"
  end

  def adsense_code(ad_slot, dimensions)
    publisher_id = 'ca-pub-5930429795374127'
    "<script async src='//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js'></script><ins class='adsbygoogle' style='display:inline-block;width:#{dimensions[:width]}px;height:#{dimensions[:height]}px' data-ad-client='#{publisher_id}' data-ad-slot='#{ad_slot}'></ins><script>(adsbygoogle = window.adsbygoogle || []).push({});</script>"
  end
end
