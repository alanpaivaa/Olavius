Rails.application.routes.draw do

  root 'application#root'

  devise_for :users, controllers: {
      passwords: 'passwords'
  }

  resources :users do

    post 'search', on: :collection
    get 'friends', on: :member

    resources :posts, only: [:create, :destroy, :update, :show], shallow: true do
      resources :images, only: [:create], shallow: true
      resources :likes, only: [:create, :destroy]
    end

    resources :invitations, only: [:create, :destroy], shallow: true do
      post 'accept', on: :member
      delete 'reject', on: :member
    end

    resources :notifications, only: [:index] do
      post 'clear', on: :collection
    end

  end

  resources :friendships, only: [:destroy]

  resources :posts, only: [] do
    resources :comments, shallow: true
  end

  get 'home', to: 'users#home'

  resources :settings, only: [:index] do
    get 'account', on: :collection
    delete 'account', to: 'settings#account_destroy', on: :collection
  end

end
