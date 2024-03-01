Rails.application.routes.draw do
  root 'table_links#index'
  get 'table_links/about'
  resources :reservations

  resources :tables

  resources :restaurants
  get 'my_restaurants', to: 'restaurants#my_restaurants'
  
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
end
