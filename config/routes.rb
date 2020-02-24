# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts
  resources :pictures, only: %i[create destroy]
  resources :tags, only: [:show]
  resources :categories, only: [:show]

  namespace :admin do
    resources :categories, except: [:show]
  end
end
