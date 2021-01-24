Rails.application.routes.draw do
  root 'palabras#index'
  resources :palabras
end
