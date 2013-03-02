Lenit::Application.routes.draw do

  # authenticated :user do
  #   root :to => 'users#show/:id'
  # end
  root :to => 'home#index'
  devise_for :users
  resources :users do
    resources :personal_events, :path => "events"
    resources :providers
    resources :followeds
    resources :followers
    member do
      post 'follow'
      post 'unfollow'
    end
  end
  
  resources :providers, :only => [:show, :index, :edit] do
    resources :provided_events, :path => "events"
    collection do
      get 'all'
    end
  end
end