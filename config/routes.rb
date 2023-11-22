# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'change_password', to: 'passwords#edit'
  patch 'change_password', to: 'passwords#update'

  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'about', to: 'about#index'
  get 'log_day', to: 'log_day#new'

  resources :cars, only: %i[new create show]
  get '/models_for_brand/:brand', to: 'cars#models_for_brand'

  root 'main#index'
end
