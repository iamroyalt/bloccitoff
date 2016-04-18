Rails.application.routes.draw do
  get "welcome/index"
  devise_for :users

  resources :users, only: [:new, :show, :create, :update] do
    resources :items, only: [ :create, :destroy ]
  end
  root to: "users#show"
end
