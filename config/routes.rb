Rails.application.routes.draw do
  resources :sectors, only: [:index]
  resources :companies, only: %i[index show]
end
