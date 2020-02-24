# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts, only: %i[show index]
  resources :tags, only: [:show]
  resources :categories, only: [:show]

  namespace :admin do
    resources :posts, except: %i[show index]
    resources :categories, except: [:show]
    resources :pictures, only: %i[create destroy]
  end
end
