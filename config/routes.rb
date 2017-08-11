Rails.application.routes.draw do

  get 'services/index'
  get 'services/show'

  namespace :admin do
    resources :services
    resources :pictures
  end

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