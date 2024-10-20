Rails.application.routes.draw do
  devise_for :users
  root to: 'boards#index'

  resources :boards
  resources :tasks
  resource :profile, only: [:show, :edit, :update]
end
