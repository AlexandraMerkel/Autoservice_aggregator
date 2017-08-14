Rails.application.routes.draw do

  # get 'user_sessions/new'
  # get 'user_sessions/create'
  # get 'user_sessions/destroy'

  root :to => 'services#index'
  get 'services/index'
  get 'services/show', as: :service

  namespace :admin do
    resources :services
    resources :pictures
    resources :users
    resources :user_sessions
  end

  get 'login' => 'admin/user_sessions#new', :as => :login
  post 'logout' => 'admin/user_sessions#destroy', :as => :logout

end