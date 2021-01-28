Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  'welcome#welcome'
  resources :restaurant_sessions, only: [:new, :create, :destroy]
  # resources :guests, only: [:index, :new, :create]
  resources :restaurants, only: [:index, :new, :show, :destroy] do
    resources :slots
  end
  resources :slots, only: [:create]
  
end
