Rails.application.routes.draw do
  scope "(:locale)", locale: /en|es/ do
    devise_for :users, controllers: { sessions: "sessions" }

    root to: 'home#index'

    get 'register' => 'users#new'

    get 'shop' => 'shop#index'

    resources :questions

    resources :products, except: 'index'
    resources :users
  end
end
