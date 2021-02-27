# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :admin_users
    resources :users
    resources :categories
    resources :styles
    resources :inventory_items
    resources :shopping_carts
    resources :shopping_cart_items
    resources :addresses
    resources :shipping_addresses
    resources :billing_addresses

    root to: 'users#index'
  end
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :inventory_items
  resources :shopping_cart_items
  resources :shopping_carts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
