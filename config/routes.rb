Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  get '/auth/:provider/callback', to: 'sessions#create'
end
