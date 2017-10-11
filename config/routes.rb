Rails.application.routes.draw do
  resources :groups
  root to: 'home#index'

  devise_for :users
end
