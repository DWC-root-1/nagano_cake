Rails.application.routes.draw do
    devise_for :customers,skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }
    devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
      sessions: "admin/sessions"
    }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: "about"
    resources :items, only: [:show, :index]
    get 'customers/my_page'  => 'customers#show', as: "my_page"
    get 'customers/information/edit'  => 'customers#edit'
    patch 'customers/information'  => 'customers#update'
    get 'customers/unsubscribe'  => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: :delete_all
    get 'orders/new' => 'orders#new'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    post 'orders/confirm' => 'orders#create'
    get 'orders' => 'orders#index'
    get 'orders/:id' => '/orders#show'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
    root to: 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create,  :edit, :update]
    resources :customers, only: [:index, :show,  :edit, :update]
    get 'orders/:id' => 'orders#show'
    patch 'orders/:id' => 'orders#update'
    patch 'order_details/:id' => 'order_details#update'
  end
end