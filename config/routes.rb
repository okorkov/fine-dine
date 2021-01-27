Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  'welcome#welcome'
  resources :guests, only: [:index, :new, :create]
  resources :restaurants, only: [:index, :new, :create, :show]
end
