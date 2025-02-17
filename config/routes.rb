Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"

  resources :posts, only: [:new, :create, :show, :edit, :update, :destroy] do
    member do
      get 'update_adoption'
    end
    collection do
      get 'search'
    end
    resources :comments, only: :create
    resource :favorites, only: [:create, :destroy]
  end

  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
    resources :comments, only: :create  
    resource :favorites, only: [:create, :destroy]
    resources :purchases, only: [:index, :create]
  end

  resources :users, only: [:show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end