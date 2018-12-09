Rails.application.routes.draw do
  
 
  namespace :admin do
    resources :users
    resources :comments
    resources :orders
    resources :products

    root to: "users#index"
  end
  
  # rerouting the landing page
  root 'simple_pages#landing_page'
  
  get 'simple_pages/contact'
  get 'simple_pages/about'
  get 'simple_pages/cart'
  get '/after_confirmation', to: 'users#after_confirmation'
  get 'payments/after', as: 'after_payments'

  post 'simple_pages/thank_you'
  post 'orders/create', as: 'create_order'
  post 'payments/create', as: 'payments'
  post 'request_admin_rights', to: 'users#request_admin_rights'

  # nested resource
  resources :products do
    resources :comments
  end

  resources :users
  resources :orders, only:[:index, :destroy]

  namespace :api do 
    namespace :v1 do 
      resources :carts, only:[:index, :create, :destroy]
    end
  end
  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
        controllers: { registrations: 'users/registrations', confirmations: 'users/confirmations' }
end
