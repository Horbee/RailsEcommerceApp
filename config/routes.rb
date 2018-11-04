Rails.application.routes.draw do
  
  # rerouting the landing page
  root 'simple_pages#landing_page'
  
  get 'simple_pages/contact'
  get 'simple_pages/about'
  
  post 'simple_pages/thank_you'

  resources :products
  resources :orders, only:[:index, :show, :create, :destroy]
  # root 'simple_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
