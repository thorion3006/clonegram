Rails.application.routes.draw do
  get 'user/profile'

  get 'user/dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Home path
  root to: 'home#index'

  # User authorization and authentication with Instagram api
  get '/oauth/connect' => 'sessions#connect', as: 'login'
  get '/oauth/callback' => 'sessions#callback', as: 'oauth_callback'
  get '/logout' => 'sessions#destroy', as: 'logout'
  
  # User Info
  get '/dashboard' => 'user#dashboard', as: 'dashboard'
  get '/profile' => 'user#profile', as: 'profile'
end
