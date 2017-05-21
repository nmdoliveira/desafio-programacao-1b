Rails.application.routes.draw do
  resources :imports, only: %i(index create)

  root "imports#index"
end
