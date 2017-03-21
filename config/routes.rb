Rails.application.routes.draw do
  resources :events, :users
  get '/signup', to: 'users#new'
  get 'events/new'
  get 'courses/index'
  get 'subjects/index'
  get 'instructors/index'
  get 'searches/index'
  get 'searches/updateEnroller'
  get 'searches/update'
  get 'enrolls/index'
  get 'enrolls/adder'
  get 'courses/searchIndex'
  get 'enrolls/creator'
  get 'enrolls/new'
  root 'enrolls#index'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


end
