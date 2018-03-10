Rails.application.routes.draw do

  root 'destinations#index'

  resources :attractions
  get "/search" =>'attractions#search'

  resources :destinations, except: :destroy
  get "/manage_destinations" => 'destinations#manage'

  resources :users

  get "/categories" => 'categories#index'
  get "/categories/new" => 'categories#new'
  post "/categories" => 'categories#create'

  get "wishes" => 'wishes#show'
  post "/wishes" => 'wishes#create'
  delete "/wishes/:id" => 'wishes#destroy'

  post "/reviews" => 'reviews#create'
  get "/reviews" => 'reviews#show'
  delete "/reviews/:id" => 'reviews#destroy'
  get "/reviews/:id/edit" => 'reviews#edit'
  patch "/reviews/:id" => 'reviews#update'

  post "/sessions" => 'sessions#create'
  get "/sessions/new" => 'sessions#new'
  get "/logout" => 'sessions#destroy'

end
