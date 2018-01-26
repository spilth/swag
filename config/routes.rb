Rails.application.routes.draw do
  devise_for :users

  resources :recordings
  resources :songs
  resources :groups
  resources :users, only: [:index, :show]

  root to: 'home#index'
end
