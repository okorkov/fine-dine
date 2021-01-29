Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  'welcome#welcome'
  resources :sessions, only: [:new, :create, :destroy]
  resources :guests, only: [:new, :show, :destroy, :edit, :update, :create] do 
    resources :reservations, only: [:index, :destroy]
  end
  resources :slots, only: [:create] 
  resources :restaurant_sessions, only: [:new, :create, :destroy]
  resources :restaurants, only: [:index, :new, :show, :destroy, :edit, :update, :create] do
    resources :reservations, only: [:show, :index, :create, :destroy]
    resources :slots, only: [:new, :edit, :update, :destroy, :index, :show] do
    end
  end

end
