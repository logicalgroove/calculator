Rails.application.routes.draw do
  root 'calculators#index'

  resources :calculators, only: [:index, :new, :show, :create]
end
