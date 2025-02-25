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
    
    resources :rooms, only: [:create, :show] do
      resources :messages, only: [:create]
    end
  end

  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
    resource :favorites, only: [:create, :destroy]
    resources :purchases, only: [:index, :create]
  end

  resources :users, only: [:show, :edit, :update, :destroy]
   
  get "up" => "rails/health#show", as: :rails_health_check
end
