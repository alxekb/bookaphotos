Rails.application.routes.draw do
  root to: 'home#index'

  resources :photo_sessions do
    get '/:session_date_id/order', to: 'photo_sessions#order', as: 'order'
  end

  resources :locations

  get '/profile', to: 'profile#show'
  get '/profile/tasks', to: 'profile#tasks', as: 'tasks'
  get '/profile/shooting_days', to: 'profile#shooting_days', as: 'shooting_days'
  get '/profile/photosessions', to: 'profile#photosessions', as: 'profile_photosessions'
  get '/profile/locations', to: 'profile#locations', as: 'profile_locations'
  get '/profile/invoices', to: 'profile#invoices', as: 'invoices'

  resources :orders

  get '/portfolio(/:theme)', to: 'portfolio#index', as: 'portfolio'
  get '/about_us', to: 'home#about', as: 'about'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
