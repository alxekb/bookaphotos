Rails.application.routes.draw do
  root to: 'home#index'

  get '/photosessions', to: 'photosessions#index', as: 'photosessions'
  get '/portfolio(/:theme)', to: 'portfolio#index', as: 'portfolio'
  get '/about_us', to: 'home#about', as: 'about'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
