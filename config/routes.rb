# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  resources :posts
  resources :pictures, only: %i[create destroy]
  resources :tags, only: [:show]
end
