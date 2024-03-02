Rails.application.routes.draw do
  #Normal Routes
  get 'user_list/index', to: 'user_list#index'
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
  
  #Devise Routes
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  
end
