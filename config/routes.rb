Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/restaurants', to: 'restaurants#index'
  get "/restaurants/new", to: 'restaurants#new'
  get '/restaurants/:id', to: 'restaurants#show'
  post '/restaurants', to: 'restaurants#create'
  get '/menu_items', to: 'menu_items#index'


  get '/menu_items/:id', to: 'menu_items#show'
  get '/drinks', to: 'drinks#index'
  get '/drinks/:id', to: 'drinks#show'

  get '/bars', to: 'bars#index'
  get '/restaurants/:id/menu_items', to: 'restaurants#restaurant_menu_items'
  get "/bars/new", to: 'bars#new'
  get '/bars/:id', to: 'bars#show'
  post '/bars', to: 'bars#create'
  get '/bars/:bar_id/drinks', to: 'bar_drinks#index'



end
