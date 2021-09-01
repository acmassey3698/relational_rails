Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Restaurants
  get '/restaurants', to: 'restaurants#index'
  get "/restaurants/new", to: 'restaurants#new'
  get '/restaurants/:id', to: 'restaurants#show'
  post '/restaurants', to: 'restaurants#create'
  get '/restaurants/:id/edit', to: 'restaurants#edit'
  patch '/restaurants/:id', to: 'restaurants#update'
  delete '/restaurants/:id', to: 'restaurants#destroy'

  #Menu items by Restaurant
  get '/restaurants/:id/menu_items', to: 'restaurant_menu_items#index'
  get '/restaurants/:id/menu_items/new', to: 'restaurant_menu_items#new'
  post '/restaurants/:id/menu_items', to: 'restaurant_menu_items#create'
  get '/menu_items/:id/edit', to: 'menu_items#edit'
  patch '/menu_items/:id', to: 'menu_items#update'

  #Menu Items
  get '/menu_items', to: 'menu_items#index'
  get '/menu_items/:id', to: 'menu_items#show'

  #Bar
  get '/bars', to: 'bars#index'
  get "/bars/new", to: 'bars#new'
  get '/bars/:id', to: 'bars#show'
  post '/bars', to: 'bars#create'
  get '/bars/:id/edit', to: 'bars#edit'
  patch '/bars/:id', to: 'bars#update'
  delete '/bars/:id', to: 'bars#destroy'

  #Drinks by Bar
  get '/bars/:id/drinks', to: 'bar_drinks#index'
  get '/bars/:id/drinks/new', to: 'bar_drinks#new'
  post '/bars/:id/drinks', to: 'bar_drinks#create'

  #Drinks
  get '/drinks', to: 'drinks#index'
  get '/drinks/:id', to: 'drinks#show'
  get '/drinks/:id/edit', to: 'drinks#edit'
  patch '/drinks/:id', to: 'drinks#update'
end
