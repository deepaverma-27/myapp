Rails.application.routes.draw do
  resources :books
  resources :categories
  resources :users
 #    root 'pages#index'
 #   get 'signup', to: 'users#new'
 #   get 'login' ,to: 'sessions#new'
 #   post 'login' , to: 'sessions#create'
 #   delete  'logout', to: 'sessions#destroy'
 # end
root 'pages#index'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
end
