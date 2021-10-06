Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  # resources :articles
  jsonapi_resources :articles
  jsonapi_resources :users, except: [:new]
  # resources :users, except: %i[new]
  # resources :categories, except: %i[destroy]
  jsonapi_resources :categories, except: %i[destroy]
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'messages', to: 'messages#index'
  post 'messages', to: 'messages#create'
end
