Rails.application.routes.draw do
  root to: 'users#index'

  get '/users', to: 'users#index', as: 'users'
  get '/signup', to: 'users#new', as: 'signup'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

  get '/events', to: 'events#index'
  get '/events/new', to: 'events#new'
  post '/events', to:'events#create'
  get '/events/:id', to: 'events#show', as: 'event'

end
