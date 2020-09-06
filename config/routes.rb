Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'pages/contact'
  resources :inventory_items, except: [:show]
  get 'inventory_item/:id', to: 'inventory_items#show', as: 'inventory_item_show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
