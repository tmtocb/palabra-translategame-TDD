# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'palabras#index'
  resources :palabras
  resources :games, only: %i[create show]
end
