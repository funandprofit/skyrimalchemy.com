module Helpers
  def menu_class(item)
    klass  = []
    klass << 'menu-wrapper'
    klass << item.to_s
    klass << 'active' if current_page.path.start_with?(item.to_s)
    klass.join(' ')
  end

  def headline(obj)
    content_tag(:h3, obj.name + uesp_link(obj).gsub('"', "'"))
  end

  def uesp_link(obj)
    link_to '', obj.uesp_link, class: 'uesp', title: "See #{obj.name} on UESP"
  end

  def tooltip(obj)
    #[headline(obj), *obj.ingredients.map{ |r| link_to(r.name, r).gsub('"', "'") }.join('<br>')].join
  end

  def effect_list(ingredient)
    (ingredient.effects & @ingredient.effects).inject([]) do |a, e|
      a << link_to(e.name, effect_path(e), class: 'effect tooltip')
    end.join(', ').html_safe
  end

  def facebook_like
    '<iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fskyrimalchemy.com&amp;send=false&amp;layout=button_count&amp;width=100&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font=arial&amp;height=21" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:80px; height:20px;" allowTransparency="true"></iframe>'.html_safe
  end

  def tweet_this
    '<a href="https://twitter.com/share" class="twitter-share-button" data-url="http://skyrimalchemy.com" data-hashtags="skyrimalchemy">Tweet</a><script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>'.html_safe
  end
end