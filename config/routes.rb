Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show]
  resources :hens, only: [] do
    resources :requests, only:[:new, :create, :edit]
  end

  get 'dashboard', to:'pages#dashboard'

end
