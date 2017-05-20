Rails.application.routes.draw do
  resources :imports, only: %i[new create]

  root "imports#new"
end
