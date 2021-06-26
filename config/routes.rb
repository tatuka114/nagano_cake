Rails.application.routes.draw do
 scope module: :public do
  root to: "homes#top"
  get "homes/about" => "homes#about"
  resources :items, only: [:index, :show]
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resource :customers, only: [:show, :edit, :update]
  get "customers/unsubscribe" => "customers#unsubscribe"
  patch "customers/withdraw" => "customers#withdraw"
  resources :cart_items, except: [:new, :show, :edit]
  delete "cart_items/destroy_all" => "cart_items#destroy_all"
  resources :orders, except: [:edit, :update, :destroy]
  post "orders/comfirm" => "orders#comfirm"
  get "orders/complete" => "orders#comlete"
  resources :addresses, except: [:new, :show]
 end
 namespace :admin do
  resources :sessions, only: [:new, :create, :destroy]
  get "homes/top" => "homes#top"
  resources :items, except: [:destroy]
  resources :genres, except: [:new, :show, :destroy]
  resources :customers, except: [:new, :create, :destroy]
  resources :orders, only: [:show, :update]
  resources :order_details, only: [:update]
 end
end
