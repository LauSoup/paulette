Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :edit, :update] do
    resources :hens, only: [:new, :create, :edit, :update]
  end

  resources :hens, only: [] do
    resources :requests, only: [:new, :create, :edit, :update]
    resources :reviews, only: [:new, :create]
  end
  resources :requests, only: [:destroy]
  get 'dashboard', to:'pages#dashboard'

end
