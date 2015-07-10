Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  get '/auth/:twitter/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
