Rails.application.routes.draw do
  root 'palabras#index'
  resources :palabras, only: %i[index new create show]
end
