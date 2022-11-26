# frozen_string_literal: true

Rails.application.routes.draw do 
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #rails g controller users index show
  root 'users#index'
  get 'users/show'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end  
  end

  namespace :api do # /api
    namespace :v1 do # /api/v1
      resources :users do # api/v1/users
        resources :posts, format: :json do # api/v1/users/:user_id/posts
          resources :comments, format: :json # api/v1/users/:user_id/posts/:post_id/comments
        end
      end
    end
  end      
end
