Rails.application.routes.draw do
  post '/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'

  resources :activities
  resources :notes
  resources :schedules
  resources :subjects
  resources :tasks
  resources :users
end
