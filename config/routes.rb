Rails.application.routes.draw do
  resources :palabras, only: %i[index new]
end
