# frozen_string_literal: true

Rails.application.routes.draw do
  # get '/users' => 'users#index'
  # get 'users/new' => 'users#new'
  # get '/users/:id' => 'users#show'
  # get 'users/:id/posts/new' => 'posts#new'
  # get '/users/:id/posts' => 'posts#index'
  # get 'users/:id/posts/:id' => 'posts#show'
  # post 'users' => 'users#create'
  # post 'posts' => 'posts#create'
  resources :users do
    resources :posts, shallow: true
  end
  mount Blog::API => '/'
end
