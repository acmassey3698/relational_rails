Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/restaurants', to: 'restaurants#index'
  get '/menu_items', to: 'menu_items#index'
  get '/restaurants/:id', to: 'restaurants#show'
  get '/menu_items/:id', to: 'menu_items#show'
  get '/drinks', to: 'drinks#index'
  get '/restaurants/:id/menu_items', to: 'restaurants#restaurant_menu_items'
end
