# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

root to: 'projects#index'

resources :sessions, only: [:new, :create]
resources :users,    only: [:index, :new, :create, :show]
resources :projects, only: [:index, :new, :create, :edit, :update]
delete 'sessions', to: 'sessions#destroy', as: :session