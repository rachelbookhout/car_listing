Rails.application.routes.draw do
  resources :cars, only: [:index,:show,:new,:create]
  resources :manufacturers, only:[:index,:show]
  root_to: 'manufacturers#index'
end
