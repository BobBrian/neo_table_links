Rails.application.routes.draw do
  get 'users/index'
  #Normal Routes
  
  root 'table_links#index'
  get 'table_links/about'

  #Modal Routes
  resources :reservations

  # resources :tables
  # resources :restaurants
  # resources :restaurants do
  #   resources :tables, only: [:new, :create, :destroy]
  # end

  resources :restaurants do
    resources :tables do
      resources :reservations, only: [:index, :new, :create]
    end
  end
  
  get 'my_restaurants', to: 'restaurants#my_restaurants'
  get 'my_reservations', to: 'reservations#my_reservations'
  
  #Devise Routes
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  
end
