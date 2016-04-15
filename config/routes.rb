Rails.application.routes.draw do
  get "welcome/index"
  devise_for :users

  resources :users, only: [:new, :show, :create, :update]

  resources :items, only: [ :create ]

  root to: "users#show"
end
