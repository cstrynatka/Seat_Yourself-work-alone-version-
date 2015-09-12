Rails.application.routes.draw do
  root 'reservations#new'
  resources :users, only: [:new, :create, :destroy, :edit, :update, :show]
  resources :restaurants
  resources :reservations
end
