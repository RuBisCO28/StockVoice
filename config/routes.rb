Rails.application.routes.draw do
  resources :sectors, only: [:index]
  resources :companies, only: %i[index show] do
    resources :stocks, only: [:index]
  end
end
