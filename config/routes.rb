# frozen_string_literal: true

Rails.application.routes.draw do
  get '/posts' => 'posts#index'
  get '/posts/:id' => 'posts#show'
  mount Blog::API => '/'
end
