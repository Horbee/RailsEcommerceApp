Rails.application.routes.draw do
  
 
  # rerouting the landing page
  root 'simple_pages#landing_page'
  
  get 'simple_pages/contact'
  get 'simple_pages/about'
  
  post 'simple_pages/thank_you'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :users
  resources :products
  resources :orders, only:[:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
