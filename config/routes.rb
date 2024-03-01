Rails.application.routes.draw do
  root 'table_links#index'
  get 'table_links/about'
  get "up" => "rails/health#show", as: :rails_health_check
end
