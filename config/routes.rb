SkyrimAlchemy::Application.routes.draw do
  resources :effects, :ingredients, :only => [:index, :show]

  root :to => 'ingredients#index'
end
