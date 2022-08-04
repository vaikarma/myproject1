Rails.application.routes.draw do
resources :orders do
  get 'myorder', :on => :collection
end
  resources :products
  get 'customer/index'
  get 'seller/index'
    get 'product/index'
  resources :customer
    root 'home#index'
      resources :carts
    devise_for :users
    resources :products 
      get 'mydashbord', to: "products#mydashbord"
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
