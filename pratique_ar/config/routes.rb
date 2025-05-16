Rails.application.routes.draw do
  resources :employee_educations
  root to: "home#page"
  resources :cities
  resources :countries
  resources :customers, except: [:destroy]
  resources :suppliers, except: [:destroy]
  resources :shippers
  resources :products
  resources :order_details
  resources :employees
  resources :categories, except: [:destroy]
  resources :orders
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
