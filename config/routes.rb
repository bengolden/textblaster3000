Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blasts, only: [:new, :create]
  resources :responses, only: :index
  resources :replies, only: [:new, :create]
  resource :tos, only: :show
  resource :authorize, only: :show
  resource :deauthorize, only: :show

  root "blasts#new"
end
