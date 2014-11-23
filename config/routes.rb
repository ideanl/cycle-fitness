Rails.application.routes.draw do
  scope "(:locale)", locale: /en|es/ do
    devise_for :users, controllers: { sessions: "sessions" }

    root to: 'home#index'

    get 'register' => 'users#new'

    resources :users
  end
end
