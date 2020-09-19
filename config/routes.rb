Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :categories
      resources :inventory_items

      root to: "users#index"
    end
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :inventory_items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
