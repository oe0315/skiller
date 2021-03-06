Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # user側のルーティング
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end
  root to: 'home#top'
  get 'home/about' => "home#about"

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  get 'users/following/:user_id' => 'users#following', as: 'following'
  get 'users/follower/:user_id' => 'users#follower', as: 'follower'
  delete 'notifications/destroy_all' => 'notifications#destroy_all'
  resources :users, only: [:index, :edit, :show, :update, :destroy] do
    resources :reviews, only: [:index, :create]
    collection do
      get 'search'
    end
  end
  resources :posts, only: [:index, :create, :edit, :update, :destroy]
  resources :recruitment_posts, only: [:index, :create, :edit, :update, :destroy]
  resources :direct_messages, only: [:create]
  resources :rooms, only: [:index, :create, :show]
  resources :searches, only: [:index]
  resources :notifications, only: [:index]
end
