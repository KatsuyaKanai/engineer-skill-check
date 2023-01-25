Rails.application.routes.draw do
  resources :notifications
  resources :dashboard, only: :index
  # post 'notifications/new', to: 'notifications#create'
  root 'employees#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :employees do
    resources :profiles
  end
end
