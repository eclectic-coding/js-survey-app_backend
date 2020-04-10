Rails.application.routes.draw do
  resources :answers
  resources :surveys
  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
end
