Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/menu_items', to: 'menu_items#index'
  get '/drinks', to: 'drinks#index'
end
