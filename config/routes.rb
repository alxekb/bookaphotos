Rails.application.routes.draw do
  root to: 'home#index'

  resources :photo_sessions do
    get '/:session_date_id/order', to: 'photo_sessions#order', as: 'order'
  end

  namespace :profile do
    get '/', to: 'profile#show'
    get '/clients', to: 'profile#clients'
    resources :locations
    resources :photo_sessions
    resources :invoices, only: [:index]
  end

  # get '/profile/tasks', to: 'profile#tasks', as: 'tasks'
  # get '/profile/shooting_days', to: 'profile#shooting_days', as: 'shooting_days'

  resources :orders

  get '/portfolio(/:theme)', to: 'portfolio#index', as: 'portfolio'
  get '/about_us', to: 'home#about', as: 'about'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
