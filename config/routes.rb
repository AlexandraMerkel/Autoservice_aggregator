Rails.application.routes.draw do

  # get 'user_sessions/new'
  # get 'user_sessions/create'
  # get 'user_sessions/destroy'

  root :to => 'admin/users#index'
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

=begin
  namespace :admin do
    get 'pictures/index'
  end

  namespace :admin do
    get 'pictures/show'
  end

  namespace :admin do
    get 'pictures/new'
  end

  namespace :admin do
    get 'pictures/create'
  end

  namespace :admin do
    get 'pictures/edit'
  end

  namespace :admin do
    get 'pictures/update'
  end

  namespace :admin do
    get 'pictures/destroy'
  end

  namespace :admin do
    get 'services/index'
  end

  namespace :admin do
    get 'services/show'
  end

  namespace :admin do
    get 'services/new'
  end

  namespace :admin do
    get 'services/create'
  end

  namespace :admin do
    get 'services/edit'
  end

  namespace :admin do
    get 'services/update'
  end

  namespace :admin do
    get 'services/destroy'
  end
=end

#For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end