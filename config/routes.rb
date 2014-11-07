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

# get 'employers/:id/edit' => 'employers#edit', as: :edit

# patch 'employers/:id' => 'employers#update'

# delete 'employers/:id' => 'employers#destroy'


root 'home#index'


get 'employers/' => 'employers#index', as: :employers

get 'employers/new' => 'employers#new', as: :new
 
post 'employers/' => 'employers#create'

get 'employers/:id' => 'employers#show', as: :employer

get 'employers/:id/edit' => 'employers#edit', as: :edit

patch 'employers/:id' => 'employers#update'

delete 'employers/:id' => 'employers#destroy'



end
