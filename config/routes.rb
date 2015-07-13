Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :states do
    resources :cities do
      resources :neighborhoods do
        resources :businesses, only: [:index, :destroy, :show, :update, :edit]
        resources :events, only: [:index, :destroy, :show, :update, :edit]
      end
    end
  end

  resources :users, only: [:index, :destroy, :show, :update, :edit]

  get '/auth/:twitter/callback', to: 'sessions#create'
  get '/auth/:facebook/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
