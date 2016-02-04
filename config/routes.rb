Rails.application.routes.draw do

  root to: "pages#home"

  get '/', to: 'pages#home'

  get '/users', to: 'users#index', as: 'users'
  get '/signup', to: 'users#new', as: 'signup'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/profile', to: 'users#show', as: 'profile'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'
  get '/users/:id/delete_team', to: 'users#delete_team', as: 'delete_team'
  post '/users/admin', to: 'users#create_admin'

  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

  get '/events', to: 'events#index', as: 'events'
  get '/events/new', to: 'events#new', as: 'new_event'
  post '/events', to:'events#create'
  get '/events/:id', to: 'events#show', as: 'event'
  get '/events/:id/edit', to: 'events#edit', as: 'edit_event'
  patch '/events/:id', to: 'events#update'

  get '/users/:user_id/pokemons', to: 'pokemons#index'
  get '/users/:user_id/pokemons/:id', to: 'pokemons#show', as: 'pokemon'
  get '/catch/:hash_data', to: 'pokemons#new', as: 'catch'
  post '/catch', to: 'pokemons#create'
end
