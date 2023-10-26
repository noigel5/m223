Rails.application.routes.draw do
  get 'package/index'
  get 'package/create'
  get 'package/edit'
  get 'package/destroy'
  get 'pages/profile'
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'users/index'
  get 'users/new'
  get 'users/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root 'pages#index'
  resources :users, only: [:index, :new, :create]
  resources :user_sessions, only: [:new, :create, :destroy]

end
