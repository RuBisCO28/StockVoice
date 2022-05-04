Rails.application.routes.draw do
  resources :sectors, only: [:index]
end
