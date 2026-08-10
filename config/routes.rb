Rails.application.routes.draw do
  resources :habbits
  root "home#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
