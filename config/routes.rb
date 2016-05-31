Rails.application.routes.draw do
 root 'users#new'

 get '/signup', to: 'users#new', as: 'signup'
 get '/login', to: 'sessions#new', as: 'login'
 get '/logout', to: 'sessions#destroy', as: 'logout'

 post '/signup', to: 'users#create'
 post '/login', to: 'sessions#create'

 resources :users
 resources :home

 resources :sellers do
 	 resources :homes
 end
   resources :addresses
end

