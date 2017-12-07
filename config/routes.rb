Rails.application.routes.draw do
  resources :blasts, only: [:new, :create]
  resources :responses, only: :index
  resources :phone_numbers, only: [:new, :create]
  resource :tos, only: :show
  resource :authorize, only: :show
  resource :deauthorize, only: :show

  root "blasts#new"
end
