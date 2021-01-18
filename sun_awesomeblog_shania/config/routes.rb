Rails.application.routes.draw do
  root 'static_pages#home'
  
  # How to create /about
  get '/about', to: 'static_pages#about'

  # How to create /contact
  get '/contact', to: 'static_pages#contact'

  # /signup
  get '/signup', to: 'users#new'

  # /login -> displays the login form only
  get '/login', to: 'sessions#new'

  # New in Rails 6
  # /login -> receives the login request from the user
  post '/login', to: 'sessions#create'

  # /logout
  get '/logout', to: 'sessions#destroy'
 
  # RESTful API for Users
  resources :users

  # All routes for Sessions
  # -> only: [] -> only is for saving memory if you only want to use a few methods
  resources :sessions, only: [:new, :create, :destroy]

  # Microposts
  resources :microposts, only: [:create, :destroy]

  # Relationships
  # /following and /follower page to show followers and followed users
  resources :users do
    member do
      get :following, :followers
    end
  end
  # Allows you to follow and unfollow
  resources :relationships, only: [:create, :destroy]
end
