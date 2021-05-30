Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  resources :books do
    resources :comments, only: :create
    resources :contents, except: :index
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :create]
end