Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'destinations#index'

  get "/users" => "users#index"
  get "/users/new" => 'users#new'
  post "/users" => 'users#create'
  get "/users/:id" => 'users#show'
  delete "/users/:id" => 'users#destroy'
  get "/users/:id/edit" => 'users#edit'
  patch "/users/:id" => 'users#update'

  get "/signup" => 'sessions#new'
  post "/sessions" => 'sessions#create'
  get "/logout" => 'sessions#destroy'

  get "/destinations" => "destinations#index"
  get "/destinations/new" => 'destinations#new'
  post "/destinations" => 'destinations#create'
  get "/destinations/:id" => 'destinations#show'
  delete "/destinations/:id" => 'destinations#destroy'
  get "/destinations/:id/edit" => 'destinations#edit'
  patch "/destinations/:id" => 'destinations#update'

  get "/attractions" => "attractions#index"
  get "/attractions/new" => 'attractions#new'
  post "/attractions" => 'attractions#create'
  get "/attractions/:id" => 'attractions#show'
  delete "/attractions/:id" => 'attractions#destroy'
  get "/attractions/:id/edit" => 'attractions#edit'
  patch "/attractions/:id" => 'attractions#update'

  get "/types/new" => 'types#new'
  post "/types" => 'types#create'
  get "/types/:id" => 'types#show'
  delete "/types/:id" => 'types#destroy'

end
