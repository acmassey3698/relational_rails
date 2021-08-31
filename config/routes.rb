Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Restaurants

  get '/restaurants', to: 'restaurants#index'
  get "/restaurants/new", to: 'restaurants#new'
  get '/restaurants/:id', to: 'restaurants#show'
  get '/restaurants/:id/edit', to: 'restaurants#edit'
  get '/restaurants/:id/menu_items', to: 'restaurant_menu_items#index'
  get '/restaurants/:id/menu_items/new', to: 'restaurant_menu_items#new'
  get '/menu_items/:id/edit', to: 'menu_items#edit'
  patch '/menu_items/:id', to: 'menu_items#update'
  post '/restaurants/:id/menu_items', to: 'restaurant_menu_items#create'
  patch '/restaurants/:id', to: 'restaurants#update'
  post '/restaurants', to: 'restaurants#create'
  get '/menu_items', to: 'menu_items#index'


  get '/menu_items/:id', to: 'menu_items#show'
  get '/drinks', to: 'drinks#index'
  get '/drinks/:id', to: 'drinks#show'

  get '/bars', to: 'bars#index'


  get "/bars/new", to: 'bars#new'
  get '/bars/:id', to: 'bars#show'
  post '/bars', to: 'bars#create'
  get '/bars/:bar_id/drinks', to: 'bar_drinks#index'
  get '/bars/:bar_id/edit', to: 'bars#edit'



end
