Lenit::Application.routes.draw do

  # authenticated :user do
  #   root :to => 'users#show/:id'
  # end
  root :to => 'home#index'
  devise_for :users, :token_authentication_key => :login_token
  resources :users do
    resources :personal_events, :path => "events"
    resources :providers
    member do
      post 'follow'
      post 'unfollow'
      get 'followed'
      get 'follower'
    end
  end
  
  resources :providers, :only => [:show, :index, :edit] do
    resources :provided_events, :path => "events"
    get 'all', on: :collection
  end
  post 'event/:id/attend' => 'events#attend', :constraints => { :id => /\d+/ }, :as => 'attend_event'
  post 'event/:id/quit' => 'events#quit', :constraints => { :id => /\d+/ }, :as => 'quit_event'

  namespace :api, :format => :json do
    resources :providers, :only => [:index, :show]
    resources :sessions, :only => [:create, :destroy]
    resources :my_providers
    resources :my_events
    resources :events
  end
end