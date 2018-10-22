Rails.application.routes.draw do
  resources :products
  root 'simple_pages#index'
  get 'simple_pages/contact'
  get 'simple_pages/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
