Rails.application.routes.draw do
  post '/login', to: 'authentication#login'
  post '/signup', to: 'application#signup'
  get '/*a', to: 'application#not_found'

  resources :activities
  resources :notes
  resources :schedules
  resources :subjects
  resources :tasks
  resources :users, except: [:create]
end
