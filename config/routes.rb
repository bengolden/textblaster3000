Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blasts, only: [:new, :create]
  resources :responses, only: :index
  resources :replies, only: [:new, :create]

  root "blasts#new"

end
