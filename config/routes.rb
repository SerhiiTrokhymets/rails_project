# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'test#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :posts
  resources :users
  mount Blog::API => '/'
end
