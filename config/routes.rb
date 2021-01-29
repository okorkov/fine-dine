Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  'welcome#welcome'
  resources :sessions, only: [:new, :create, :destroy]
  resources :guests, only: [:new, :show, :destroy, :edit, :update, :create]
  resources :restaurant_sessions, only: [:new, :create, :destroy]
  resources :slots, only: [:create]
  resources :restaurants, only: [:index, :new, :show, :destroy, :edit, :update, :create] do
    resources :slots, only: [:new, :edit, :create, :update, :destroy, :index, :show] do
    end
    resources :reservations, only: [:new, :create, :show, :destroy]
  end
  
  
end
