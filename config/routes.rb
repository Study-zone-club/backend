Rails.application.routes.draw do
  resources :activities
  resources :notes
  resources :schedules
  resources :subjects
  resources :tasks
  resources :users, except: [:create]

  post '/login', to: 'authentication#login'
  post '/signup', to: 'users#create'
  get '/*a', to: 'application#not_found'
end
