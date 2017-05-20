Rails.application.routes.draw do
  resources :imports, only: %i[new create]
  resources :orders, only: :index

  root "imports#new"
end
