Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root  'welcome#welcome'
  get '/search' => 'restaurants#search', :as => 'search_page'
  get '/most-restaurants' => 'cities#most_restaurants'
  get '/most-reviews' => "reviews#restraurant_with_most_reviews"

  resources :sessions, only: [:new, :create, :destroy]
  resources :guests, only: [:new, :destroy, :edit, :update, :create] do 
    resources :reservations, only: [:index, :destroy]
  end
  resources :slots, only: [:create] 
  resources :cities, only: [:index] do
    resources :restaurants, only: [:index]
  end
  resources :restaurant_sessions, only: [:new, :create, :destroy]
  resources :restaurants, only: [:index, :new, :show, :destroy, :edit, :update, :create] do
    resources :reservations, only: [:show, :index, :create]
    resources :slots, only: [:new, :edit, :update, :destroy, :index, :show]
  end
  resources :reviews, only: [:create]

  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get, :post]

  # match "*any", via: :all, to: "errors#not_found"

end
