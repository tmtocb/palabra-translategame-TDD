Rails.application.routes.draw do
  devise_for :users
  root 'palabras#index'
  resources :palabras
end
