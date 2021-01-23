Rails.application.routes.draw do
  resources :palabras, only: [:index]
end
