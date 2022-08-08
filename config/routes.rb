Rails.application.routes.draw do
resources :orders do
  get 'myorder', :on => :collection
end
  resources :products
  get 'customer/index'
    get 'products/index'
  resources :customer
    root 'home#index'
      resources :carts
    devise_for :users
    devise_scope :user do  
      get '/users/sign_out' => 'devise/sessions#destroy'     
   end
    resources :products
      get 'mydashbord', to: "products#mydashbord"
      post 'search', to: "customer#search"
      post 'searchp', to: "products#searchp"
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
