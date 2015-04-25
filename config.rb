require 'lib/helpers'
helpers Helpers

activate :directory_indexes

set :haml, { :ugly => true, :format => :html5 }

ignore '/effect_template.html'
ignore '/ingredient_template.html'

