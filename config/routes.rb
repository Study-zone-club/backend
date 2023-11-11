Rails.application.routes.draw do
  resources :schedules
  resources :subjects
  resources :tasks
  resources :users, except: [:create]
  post '/signup', to: 'users#create'
  post '/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
