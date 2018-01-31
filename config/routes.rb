Rails.application.routes.draw do
  devise_for :users

  resources :songs, shallow: true do
    resources :recordings
  end

  resources :groups
  resources :users, only: [:index, :show]

  root to: 'home#index'
end
