Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :states do
    resources :cities, only: [:new, :create, :index]
  end

  resources :cities, except: [:new, :create] do
    resources :neighborhoods, only: [:new, :create, :index]
  end

  resources :neighborhoods, except: [:new, :create] do
    resources :events, only: [:new, :create, :index]
    resources :businesses, only: [:new, :create, :index]
  end

  resources :events, except: [:new, :create, :index] do
      resources :reviews, only: [:index, :destroy, :new, :create, :show, :update, :edit]
  end

  resources :businesses, except: [:new, :create] do
    resources :reviews, only: [:index, :destroy, :new, :create, :show, :update, :edit]
  end
  
  #
  # resources :events, only: [:index, :destroy, :new, :create, :show, :update, :edit] do
  #     resources :reviews, only: [:index, :destroy, :new, :create, :show, :update, :edit]
  # end

  resources :users, only: [:index, :new, :create, :destroy, :show, :update, :edit]
  resources :categories, only: [:index, :new, :create, :destroy, :show, :update, :edit]
  # resources :votes, only: [:create, :new, :destroy]
  #
  # get '/auth/:twitter/callback', to: 'sessions#create'
  # get '/auth/:facebook/callback', to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy'
end
