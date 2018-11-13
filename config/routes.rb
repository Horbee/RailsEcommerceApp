Rails.application.routes.draw do
  
 
  # rerouting the landing page
  root 'simple_pages#landing_page'
  
  get 'simple_pages/contact'
  get 'simple_pages/about'
  
  get '/after_confirmation', to: 'users#after_confirmation'

  post 'simple_pages/thank_you'
  post 'orders/create', as: 'create_order'

  # nested resource
  resources :products do
    resources :comments
  end

  resources :users
  resources :orders, only:[:index, :show, :destroy]
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }, controllers: { registrations: 'users/registrations', confirmations: 'users/confirmations' }
end
