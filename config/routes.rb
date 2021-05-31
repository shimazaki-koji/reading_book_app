Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'do
    root to: 'contents#index'
  end
  resources :books do
    resources :contents #do
      #resources :comments, only: :create
    #end
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :create]
end