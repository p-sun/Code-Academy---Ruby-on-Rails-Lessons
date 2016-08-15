Rails.application.routes.draw do
  root 'welcome#index'

  # Declare a standard REST resource. i.e. a collection of similar objects.
  # You can create, read, update and destroy items for a resource (CRUD operations).
  # $ rails routes           to see the defined REST operations
  resources :articles

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
