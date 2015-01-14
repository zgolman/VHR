Rails.application.routes.draw do

    get 'signup', to: 'users#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    post 'login', to: 'sessions#create', as: 'createlogin'
    get 'logout', to: 'sessions#destroy', as: 'logout'
 	
 
  	resources :resources
 
  # resources :users

get 'users/' => 'users#index', as: :current_user

get 'users/new' => 'users#new', as: :new_user
 
post 'users/' => 'users#create'

get 'users/:id' => 'users#show', as: :user


# delete 'paystubs/:id' => 'paystubs#destroy'

# get 'paystubs/:id/edit' => 'paystubs#edit', as: :edit

# patch 'paystubs/:id' => 'paystubs#update'

# delete 'paystubs/:id' => 'paystubs#destroy'


root 'home#index'


get 'paystubs/' => 'paystubs#index', as: :paystubs

get 'paystubs/new' => 'paystubs#new', as: :new
 
post 'paystubs/' => 'paystubs#create'

get 'paystubs/:id' => 'paystubs#show', as: :paystub

get 'paystubs/:id/edit' => 'paystubs#edit', as: :edit

patch 'paystubs/:id' => 'paystubs#update'

delete 'paystubs/:id' => 'paystubs#destroy' 



end
