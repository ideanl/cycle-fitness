Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  get 'register' => 'users#new'

  resources :users
end
