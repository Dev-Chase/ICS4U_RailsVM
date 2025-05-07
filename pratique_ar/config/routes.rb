Rails.application.routes.draw do
  resources :customers
  resources :suppliers
  resources :shippers
  resources :products
  resources :order_details
  resources :employees
  resources :categories
  resources :orders
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
