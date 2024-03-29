Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:new, :edit, :update ]
  resources :items do
    resources :orders
  end
  resources :pays
  resources :address
end