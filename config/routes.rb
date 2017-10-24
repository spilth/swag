Rails.application.routes.draw do
  resources :recordings
  resources :songs
  resources :groups
  root to: 'home#index'

  devise_for :users
end
