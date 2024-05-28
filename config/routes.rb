Rails.application.routes.draw do
  namespace :public do
    get 'search/search'
  end
  namespace :admin do
    get 'search/search'
  end
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
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :orders, only: [:index, :new, :create, :show] do
      collection do
        get 'complete'
        post 'confirm'
      end
    get "search" => "searches#search"
    end

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
    root to: 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show,  :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
  get "search" => "searches#search"
end