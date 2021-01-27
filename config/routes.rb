Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  'welcome#welcome'
  get '/restaurant-login', to: "welcome#restaurant"
  get '/guest-login', to: "welcome#guest"
  resources :guests, only: [:index, :new, :create]
  resources :restaurants, only: [:index, :new, :create, :show]
end
