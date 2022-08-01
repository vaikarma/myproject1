Rails.application.routes.draw do
  resources :products
  get 'customer/index'
  get 'seller/index'
    get 'product/index'
  resources :customer
    root 'home#index'
 
    devise_for :users do
      resources :products
    end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
