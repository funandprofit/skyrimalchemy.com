require 'lib/helpers'
helpers Helpers

activate :minify_css
activate :minify_javascript
activate :directory_indexes

activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true
end

set :haml, { :ugly => true, :format => :html5 }

data.ingredients.each do |ingredient|
  proxy "/ingredients/#{ingredient.slug}.html", '/ingredient_template.html', locals: { ingredient: ingredient, title: "#{ingredient.name} - Skyrim Alchemy Potion Ingredients" }
end

data.effects.each do |effect|
  proxy "/effects/#{effect.slug}.html", '/effect_template.html', locals: { effect: effect, title: "#{effect.name} - Skyrim Alchemy Potion Effects" }
end

ignore '/effect_template.html'
ignore '/ingredient_template.html'
