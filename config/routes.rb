Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'public/homes#top'
  get 'about' => 'public/homes#top'

  resources :items, only: [:show, :index]

  get 'customers/my_page'  => 'public/customers#show'
  get 'customers/information/edit'  => 'public/customers#edit'
  patch 'customers/information'  => 'public/customers#update'
  get 'customers/unsubscribe'  => 'publick/customers#unsubscribe'
  patch 'customers/withdraw' => 'public/customers#withdraw'

  resources :cart_items, only: [:index, :update, :destroy, :create]
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: :delete_all

  get 'orders/new' => 'public/orders#new'
  post 'orders/confirm' => 'public/orders#confirm'
  get 'orders/complete' => 'public/orders#complete'
  post 'orders' => 'public/orders#create'
  get 'orders' => 'public/orders#index'
  get 'orders/:id' => 'public/orders#show'

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
    get 'admin' => 'admin#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create,  :edit, :update]
    resources :customers, only: [:index, :show,  :edit, :update]
    get 'orders/:id' => 'orders#show'
    patch 'orders/:id' => 'orders#update'
    patch 'order_details/:id' => 'order_details#update'
  end

end
